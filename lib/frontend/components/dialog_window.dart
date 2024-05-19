import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/backend/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/frontend/routes/app_routes.dart';
import 'package:notes_app/frontend/style/app_colors.dart';
import 'package:notes_app/frontend/style/app_style.dart';
import 'package:provider/provider.dart';

class DialogWindow extends StatelessWidget {
  const DialogWindow({
    super.key,
    required this.index,
    required this.title,
    required this.text,
  });

  final int index;
  final String title, text;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return AlertDialog(
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: AppStyle.fontStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        text,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: AppStyle.fontStyle.copyWith(
          fontSize: 14,
        ),
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: FloatingActionButton(
            onPressed: () {
              context.go(AppRoutes.changeNotes, extra: index);
              model.setControllers(index);
              Navigator.pop(context);
            },
            elevation: 3,
            backgroundColor: Colors.deepPurpleAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.edit.tr(),
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 16,
                    color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: FloatingActionButton(
            onPressed: () {
              model.deleteNote(context, index);
            },
            elevation: 3,
            backgroundColor: AppColors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.delete.tr(),
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.delete_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.all(25),
      actionsOverflowAlignment: OverflowBarAlignment.start,
    );
  }
}
