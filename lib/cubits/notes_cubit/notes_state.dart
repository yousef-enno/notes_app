part of 'notes_cubit.dart';

sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesSuccess extends NotesCubitState{
   final List<NoteModel> notes;
  NotesSuccess(this.notes);
}
