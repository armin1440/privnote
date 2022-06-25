import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayLinkScreen extends StatelessWidget {
  const DisplayLinkScreen({Key? key}) : super(key: key);

  static const String id = '/DisplayLinkScreen';

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
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Note Link Ready'),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(5),
                child: const Text('The link'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                ClipboardData data = const ClipboardData(text: 'some text');
                await Clipboard.setData(data);
              } , child: const Text('Copy to Clipboard'),)
            ],
          ),
        ),
      ),
    );
  }
}
