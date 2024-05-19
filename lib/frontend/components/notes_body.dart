import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/backend/hive/hive_box.dart';
import 'package:notes_app/backend/hive/notes_data.dart';
import 'package:notes_app/backend/providers/notes_provider.dart';
import 'package:notes_app/frontend/components/card_widget.dart';
import 'package:notes_app/frontend/components/dialog_window.dart';
import 'package:notes_app/frontend/pages/note_about_page.dart';
import 'package:provider/provider.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  void onShowDialog(BuildContext context, int i, List<NotesData> allNotes) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWindow(
          index: i,
          title: allNotes[i].title,
          text: allNotes[i].text,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {
        final allNotes = notes.values.toList();
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 540) {
              return GridView.builder(
                controller: model.scrollController,
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {},
                    onLongPress: () {
                      onShowDialog(context, i, allNotes);
                    },
                    child: CardWidget(
                      title: allNotes[i].title,
                      date: allNotes[i].date,
                      text: allNotes[i].text,
                    ),
                  );
                },
                itemCount: allNotes.length,
              );
            } else {
              return ListView.separated(
                controller: model.scrollController,
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 15,
                ),
                itemCount: allNotes.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const NoteAboutPage(),
                        ),
                      );
                    },
                    onLongPress: () {
                      onShowDialog(context, i, allNotes);
                    },
                    child: CardWidget(
                      title: allNotes[i].title,
                      date: allNotes[i].date,
                      text: allNotes[i].text,
                    ),
                  );
                },
                separatorBuilder: (context, i) => const SizedBox(height: 16),
              );
            }
          },
        );
      },
    );
  }
}
