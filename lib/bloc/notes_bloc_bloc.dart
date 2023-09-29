import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notes_bloc_event.dart';
part 'notes_bloc_state.dart';

class NotesBlocBloc extends Bloc<NotesBlocEvent, NotesBlocState> {
  NotesBlocBloc() : super(NotesBlocInitial()) {
    on<NotesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
