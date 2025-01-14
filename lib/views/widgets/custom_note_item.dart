import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNotesView(note: note);
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 25,
          top: 25,
          left: 18,
        ),
        decoration: BoxDecoration(
          color: Color(note.color) ,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  note.title,
                  style: const TextStyle(fontSize: 26, color: Colors.black),
                ),
              ),
              subtitle: Text(
                note.subTitle,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Note  deleted'),
                    ),
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
