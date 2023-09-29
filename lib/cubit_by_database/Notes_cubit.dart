// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit_/Database/Note%20Model.dart';
import 'package:notes_app_cubit_/cubit_by_database/Notes_state.dart';
import '../Database/Db Helper.dart';

class NoteCubit extends Cubit<NoteState> {
  DB_helper db;

  NoteCubit({required this.db}) : super(InitialState());

  //database Methods
  void addNotes(noteModel newnote) async {
    emit(LoadingState());

    bool check = await db.addNotes(newnote);
    if (check) {
      var Notes = await db.fetchAllNotes();
      emit(LoadedState(arrNotes: Notes));
    } else {
      emit(ErrorState(errorMsg: 'Notes not added'));
    }
  }

  void deleteNotes(noteModel index, List<noteModel>? arrNotes) async {
    emit(LoadingState());
    if (index.note_id == -1) {
      db.deleteNotes(index as int);
      emit(LoadedState(arrNotes: arrNotes));
    } else {
      emit(ErrorState(errorMsg: 'Empty'));
    }
  }

  void getAllnotes() async {
    emit(LoadingState());
    var notes = await db.fetchAllNotes();
    emit(LoadedState(arrNotes: notes));
  }
}
