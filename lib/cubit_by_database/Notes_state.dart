import 'package:notes_app_cubit_/Database/Note%20Model.dart';

abstract class NoteState {}

class InitialState extends NoteState {}

class LoadingState extends NoteState {}

class LoadedState extends NoteState {
  List<noteModel>? arrNotes;
  int? id;
  LoadedState({this.arrNotes, this.id});
}

class ErrorState extends NoteState {
  String errorMsg;
  ErrorState({required this.errorMsg});
}
