import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/app_bar_view.dart';
import 'package:notes_app/views/widgets/color_item.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_app_bar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note, this.onPressed});
  final NoteModel note;
  final void Function()? onPressed;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late final TextEditingController titleController, contentController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.subTitle);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          EditAppBar(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Note  Edited  Done'),
                ),
              );
              widget.note.title = titleController.text;
              widget.note.subTitle = contentController.text;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(controller: titleController, hint: widget.note.title),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: contentController,
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          EditListViewColors(
            note: widget.note,
          )
        ],
      ),
    );
  }
}

class EditListViewColors extends StatefulWidget {
  const EditListViewColors({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditListViewColors> createState() => _EditListViewColorsState();
}

class _EditListViewColorsState extends State<EditListViewColors> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = kColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  picked: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}






// ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Note  Edited  Done'),
//                 ),
//               );
//               widget.note.title = titleController.text;
//               widget.note.subTitle = contentController.text;
//               widget.note.save();
//               BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//               Navigator.pop(context);