import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_state.dart';

class NotesCubit extends Cubit<NotesState> {
  //initialState
  NotesCubit() : super(NotesState(arrData: []));

  //events
  void addData(Map<String, dynamic> data) {
    var listData = state.arrData;
    listData.add(data);
    emit(NotesState(
        arrData: state.arrData, errorMsg: 'Error occured!!', isError: true));
  }

  void deleteData(int index) {
    var listData = state.arrData;
    listData.removeAt(index);
    emit(NotesState(arrData: listData));
  }

  void updateData(Map<String, dynamic> data, int index) {
    var listData = state.arrData;
    //overide updata in list
    listData[index] = data;
    emit(NotesState(arrData: listData));
  }
}
