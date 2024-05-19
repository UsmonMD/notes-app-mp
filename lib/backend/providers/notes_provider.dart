import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/backend/hive/hive_box.dart';
import 'package:notes_app/backend/hive/notes_data.dart';
import 'package:notes_app/frontend/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    getTheme();
  }
  
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final scrollController = ScrollController();

  //switch
  bool isTheme = false;

  Future<void> changeTheme(bool value) async {
    isTheme = value;
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('theme', isTheme);
    notifyListeners(); // Обновление виджетов, зависящих от темы
  }

  Future<void> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    isTheme = pref.getBool('theme') ?? isTheme;
    notifyListeners(); // Обновление виджетов, зависящих от темы
  }


  //добавление заметки
  Future<void> onAddNotes(BuildContext context) async {
    await HiveBoxes.notes
        .add(
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : 'Заметка',
            text: noteController.text.isNotEmpty
                ? noteController.text
                : 'Описание',
          ),
        )
        // .then(
        //   (value) => scrollController
        //       .jumpTo(scrollController.position.maxScrollExtent),
        // )
        .then((value) => controllerClear())
        .then(
          (value) => context.go(AppRoutes.home),
        );
  }

  //установка значений
  void setControllers(int index) async {
    titleController.text = HiveBoxes.notes.getAt(index)?.title ?? 'Error';
    noteController.text = HiveBoxes.notes.getAt(index)?.text ?? 'Error';
  }

  //очищение контроллеров
  controllerClear() {
    titleController.clear();
    noteController.clear();
  }

  //удаление заметки
  Future<void> deleteNote(BuildContext context, int index) async {
    await HiveBoxes.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

  //изменение заметки
  Future<void> onChangeNotes(BuildContext context, int index) async {
    await HiveBoxes.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text,
            text: noteController.text,
          ),
        )
        .then((value) => controllerClear())
        .then((value) => context.go(AppRoutes.home));
  }

  changeLanguage(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      context.setLocale(
        const Locale('en'),
      );
    } else {
      context.setLocale(
        const Locale('ru'),
      );
    }
    notifyListeners();
  }
}
