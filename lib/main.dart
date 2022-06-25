import 'package:flutter/material.dart';
import 'package:privnote/create_note_screen.dart';
import 'package:privnote/display_link_screen.dart';
import 'package:privnote/display_note_screen.dart';
import 'package:privnote/warning_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: CreateNoteScreen.id,
      routes: {
        CreateNoteScreen.id: (context) => const CreateNoteScreen(),
        DisplayLinkScreen.id: (context) => const DisplayLinkScreen(),
        WarningScreen.id: (context) => const WarningScreen(),
        DisplayNoteScreen.id: (context) => const DisplayNoteScreen(),
      },
      home: const CreateNoteScreen(),
    );
  }
}
