import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:privnote/display_link_screen.dart';
import 'package:uuid/uuid.dart';

import 'Classes.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  static const String id = '/CreateNoteScreen';

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController textC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          width: 400,
          height: 260,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('New Note'),
              const SizedBox(height: 20),
              Container(
                color: Colors.cyan,
                child: TextField(
                  controller: textC,
                  maxLines: 7,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                child: const Text('Create'),
                onPressed: () async {
                  bool isSuccessful = await createNote();
                  if (isSuccessful) {
                    Navigator.pushNamed(context, DisplayLinkScreen.id);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const SimpleDialog(
                        title: Text('Error'),
                        children: [Text('Please try again.')],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> createNote() async {
    var uuid = const Uuid();
    String note = textC.text;
    String id = uuid.v1();
    Note dbNote = Note(text: note, id: id);
    try {
      var response = await Dio().post('http://localhost:4040/', data: dbNote.toJson());
      return (response.statusCode ?? 500) / 100 == 2;
      // print(response);
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
