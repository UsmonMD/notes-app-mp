import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/backend/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/frontend/style/app_style.dart';
import 'package:provider/provider.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.btnText,
    required this.func,
  });

  final String btnText;
  final Function func;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWidget(
              labelText: LocaleKeys.title.tr(),
              hintText: LocaleKeys.title.tr(),
              controller: model.titleController,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              labelText: LocaleKeys.note.tr(),
              hintText: LocaleKeys.note.tr(),
              controller: model.noteController,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.deepPurpleAccent,
                heroTag: 'add-btn',
                elevation: 2,
                onPressed: () {
                  func();
                },
                label: Text(
                  btnText,
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  final String labelText, hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: AppStyle.fontStyle.copyWith(
            fontSize: 12,
          ),
          hintText: hintText,
          hintStyle: AppStyle.fontStyle.copyWith(
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.deepPurpleAccent),
          ),
        ),
      ),
    );
  }
}
