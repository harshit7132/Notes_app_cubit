import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit_/cubit_state.dart';

class NotesCubit extends Cubit<NotesState> {
  //initialState
  NotesCubit() : super(NotesState(arrData: []));

  //events
  void addData(Map<String, dynamic> data) {
    var listData = state.arrData;
    listData.add(data);
    emit(NotesState(arrData: state.arrData));
  }

  void deleteData(int index) {
    var listData = state.arrData;
    listData.removeAt(index);

    emit(NotesState(arrData: listData));
  }
}
