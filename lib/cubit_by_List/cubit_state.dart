class NotesState {
  List<Map<String, dynamic>> arrData;
  bool isError;
  String errorMsg;

  NotesState({required this.arrData, this.isError = false, this.errorMsg = ""});
}
