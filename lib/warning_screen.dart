import 'package:flutter/material.dart';
import 'package:privnote/create_note_screen.dart';
import 'package:privnote/display_link_screen.dart';

import 'display_note_screen.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({Key? key}) : super(key: key);

  static const String id = '/WarningScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          height: 200,
          width: 400,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text('Read and Destroy'),
              const SizedBox(height: 20),
              const Text('You\'re about to read and destroy sth'),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    child: const Text('Yes show me the note'),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, DisplayNoteScreen.id);
                    },
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    child: const Text('No not now'),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, CreateNoteScreen.id);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
