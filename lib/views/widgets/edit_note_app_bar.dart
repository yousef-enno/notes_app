import 'package:flutter/material.dart';

class EditAppBar extends StatelessWidget {
  const EditAppBar({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Edit Note',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        Spacer(),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.check))
      ],
    );
  }
}