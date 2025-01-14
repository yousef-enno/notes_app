import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          List<NoteModel> notes = state.notes;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
                itemCount: notes.length,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Slidable(
                        key: ValueKey(notes[index]),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                notes[index].delete();
                                BlocProvider.of<NotesCubit>(context)
                                    .fetchAllNotes();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Note  deleted'),
                                  ),
                                );
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        startActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              notes[index].delete();
                              BlocProvider.of<NotesCubit>(context)
                                  .fetchAllNotes();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Note  deleted'),
                                ),
                              );
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ]),
                        child: NoteItem(
                          note: notes[index],
                        )),
                  );
                }),
          );
        } else if (state is NotesCubitInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(child: Text('No notes found'));
        }
      },
    );
  }
}





// List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).allNotes ?? [];