import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit_/Screens/add_notes_by_database.dart';
import 'package:notes_app_cubit_/cubit_by_database/Notes_cubit.dart';
import 'package:notes_app_cubit_/cubit_by_database/Notes_state.dart';

import '../Database/Note Model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteCubit>().getAllnotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('all notes')),
      body: BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ErrorState) {
          return Center(child: Text('Error : ${state.errorMsg}'));
        } else if (state is LoadedState) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Text('${index + 1}'),
                    title: Text('${state.arrNotes![index].title}'),
                    subtitle: Text('${state.arrNotes![index].desc}'),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<NoteCubit>().deleteNotes(
                            state.arrNotes![index], state.arrNotes);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
              itemCount: state.arrNotes!.length);
        }
        ;
        return Container();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Add_NotesPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
