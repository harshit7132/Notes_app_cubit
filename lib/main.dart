// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit_/Database/Db%20Helper.dart';
import 'package:notes_app_cubit_/Screens/second.dart';
import 'package:notes_app_cubit_/cubit_by_database/Notes_cubit.dart';
import 'Screens/HomePage.dart';
import 'cubit_by_List/cubit.dart';
import 'cubit_by_List/cubit_state.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => NoteCubit(db: DB_helper.db)),
    BlocProvider(
      create: (context) => NotesCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var utitleController = TextEditingController();
    var udescController = TextEditingController();
    return Scaffold(
        body: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return state.arrData.isNotEmpty
                ? ListView.builder(
                    itemCount: state.arrData.length,
                    itemBuilder: (_, index) {
                      var title = state.arrData[index]['title'];
                      var desc = state.arrData[index]['desc'];
                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: Column(children: [
                                    TextField(
                                        controller: utitleController,
                                        decoration: InputDecoration(
                                            hintText: '$title')),
                                    TextField(
                                        controller: udescController,
                                        decoration:
                                            InputDecoration(hintText: '$desc')),
                                    ElevatedButton(
                                        onPressed: () {
                                          var utitle =
                                              utitleController.text.toString();
                                          var udesc =
                                              udescController.text.toString();
                                          context.read<NotesCubit>().updateData(
                                              {'title': utitle, 'desc': udesc},
                                              index);
                                          Navigator.pop(context);
                                        },
                                        child: Text('update'))
                                  ])));
                        },
                        child: ListTile(
                          leading: Text('${index + 1}'),
                          subtitle: Text('${state.arrData[index]['desc']}'),
                          title: Text('${state.arrData[index]['title']}'),
                          trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context.read<NotesCubit>().deleteData(index);
                              }),
                        ),
                      );
                    },
                  )
                : const Center(child: Text('No Data Found'));
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ));
            }));
  }
}
