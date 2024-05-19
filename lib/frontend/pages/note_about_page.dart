import 'package:flutter/material.dart';
import 'package:notes_app/frontend/components/about_note_body.dart';

class NoteAboutPage extends StatelessWidget {
  const NoteAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: const AboutNoteBody(),
    );
  }
}
