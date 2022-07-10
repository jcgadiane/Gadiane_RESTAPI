import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lesson1/services/notes_services.dart';
import 'package:lesson1/views/note_list.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NoteService());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}
