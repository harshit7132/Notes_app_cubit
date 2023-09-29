import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit_by_List/cubit.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
      ),
        body: Center(
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
                      .read<NotesCubit>()
                      .addData({'title': title, 'desc': desc});
                  Navigator.pop(context);
                } else {
                  print('Enter all fields');
                }
              },
              child: Text('Add'))
        ],
      ),
    ));
  }
}
