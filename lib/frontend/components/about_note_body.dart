import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/backend/hive/hive_box.dart';
import 'package:notes_app/frontend/style/app_style.dart';

class AboutNoteBody extends StatelessWidget {
  const AboutNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = HiveBoxes.notes.values.toList();
    final extra =
        GoRouter.of(context).routerDelegate.currentConfiguration.extra;
    final index = extra is int ? extra : 0;
    final mq = MediaQuery.of(context).size;
    return SizedBox(
      height: mq.height,
      width: mq.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Text(
              notes[index].title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 5),
            Text(
              notes[index].date,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 5),
            Text(
              notes[index].text,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
