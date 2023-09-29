import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit_/Database/Note%20Model.dart';
import '../cubit_by_database/Notes_cubit.dart';
import '../cubit_by_database/Notes_state.dart';


class Add_NotesPage extends StatefulWidget {
  const Add_NotesPage({super.key});

  @override
  State<Add_NotesPage> createState() => _Add_NotesPageState();
}

class _Add_NotesPageState extends State<Add_NotesPage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Notes By Database'),
        ),
        body: BlocBuilder<NoteCubit,NoteState>(builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: 'Title')),
                SizedBox(height: 40,),
                TextField(
                    controller: descController,
                    decoration: InputDecoration(hintText: 'Desc')),
                SizedBox(height: 40,),
                ElevatedButton(
                    onPressed: () {
                      var title = titleController.text.toString();
                      var desc = descController.text.toString();

                      if (title != ' ' && desc != ' ') {
                        context
                            .read<NoteCubit>()
                            .addNotes(noteModel(title: title,desc: desc));
                        Navigator.pop(context);
                      } else {
                        print('Enter all fields');
                      }
                    },
                    child: Text('Add'))
              ],
            ),
          );
        },));
  }
}
