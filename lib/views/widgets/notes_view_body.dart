import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/app_bar_view.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 40,),
          CustomAppBar(title: 'Notes', icon: Icons.search,),
          
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
