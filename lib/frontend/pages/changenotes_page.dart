import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/backend/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/frontend/components/form_widget.dart';
import 'package:notes_app/frontend/components/go_home.dart';
import 'package:notes_app/frontend/style/app_style.dart';
import 'package:provider/provider.dart';

class ChangeNotesPage extends StatelessWidget {
  const ChangeNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final extra =
        GoRouter.of(context).routerDelegate.currentConfiguration.extra;
    final index = extra is int ? extra : 0;

    final model = context.watch<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.changeNote.tr(),
          style: AppStyle.fontStyle.copyWith(fontSize: 30),
        ),
        centerTitle: true,
        leading: const GoHome(),
      ),
      body: FormWidget(
        btnText: LocaleKeys.change.tr(),
        func: () {
          model.onChangeNotes(context, index);
        },
      ),
    );
  }
}
