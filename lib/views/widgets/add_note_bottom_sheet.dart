import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            CustomTextField(
              hint: 'Title',
            ),
            SizedBox(
              height: 22,
            ),
            CustomTextField(
              hint: 'Content',
              maxLines: 6,
            ),
            SizedBox(
              height: 30,
            ),
            CustomBottom(),
          ],
        ),
      ),
    );
  }
}

