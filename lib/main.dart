import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit_/cubit.dart';
import 'package:notes_app_cubit_/cubit_state.dart';
import 'package:notes_app_cubit_/second.dart';

void main() {
  runApp(BlocProvider(create: (context) => NotesCubit(), child: MyApp()));
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return state.arrData.isNotEmpty
                ? ListView.builder(
                    itemCount: state.arrData.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: Text('${index + 1}'),
                        subtitle: Text('${state.arrData[index]['desc']}'),
                        title: Text('${state.arrData[index]['title']}'),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              context.read<NotesCubit>().deleteData(index);
                            }),
                      );
                    },
                  )
                : Center(child: Text('No Data Found'));
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ));
            }));
  }
}
