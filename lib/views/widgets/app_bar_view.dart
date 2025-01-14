import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isSearching
            ? Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search notes.... ',
                    border: InputBorder.none,
                  ),
                  onChanged: (query) {
                    BlocProvider.of<NotesCubit>(context).searchNotes(query);
                  },
                ),
              )
            : Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
        Spacer(),
        IconButton(
          icon: Icon(
            isSearching ? Icons.close : widget.icon,
          ),
          onPressed: () {
            if (isSearching) {
              searchController.clear();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            }
            setState(() {
              isSearching = !isSearching;
            });
          },
        )
      ],
    );
  }
}

// Text(
//           title,
//           style: TextStyle(
//             fontSize: 28,
//           ),
//         ),
//         Spacer(),
//         CustomIcon(
//           onPressed: onPressed,
//           icon: icon,
//         ),
