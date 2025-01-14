import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());
  List<NoteModel>? allNotes;
  List<NoteModel>? filteredNotes;
  fetchAllNotes() async {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    allNotes = noteBox.values.toList();
    filteredNotes = allNotes;
    emit(NotesSuccess(filteredNotes!));
  }

  searchNotes(String query) {
    if (query.isEmpty) {
      filteredNotes = allNotes;
    } else {
      filteredNotes = allNotes?.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.subTitle.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(NotesSuccess(filteredNotes!));
    }
  }
}
