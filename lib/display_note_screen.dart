import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privnote/create_note_screen.dart';

class DisplayNoteScreen extends StatefulWidget {
  const DisplayNoteScreen({Key? key}) : super(key: key);

  static const String id = '/DisplayNoteScreen';

  @override
  State<DisplayNoteScreen> createState() => _DisplayNoteScreenState();
}

class _DisplayNoteScreenState extends State<DisplayNoteScreen> {
  String note = '';

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  void getHttp() async {
    try {
      var response = await Dio().get('http://localhost:4040/');
      setState(() {
        note = response.data.toString();
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Note Contents'),
              const SizedBox(height: 20),
              Flexible(
                child: Container(
                  color: Colors.cyan.shade300,
                  padding: const EdgeInsets.all(10),
                  child: Text(note),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                child: const Text('To the first page'),
                onPressed: () => Navigator.pushReplacementNamed(context, CreateNoteScreen.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}
