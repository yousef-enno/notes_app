import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/app_bar_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
         CustomAppBar(),
        ],
      ),
    );
  }
}


