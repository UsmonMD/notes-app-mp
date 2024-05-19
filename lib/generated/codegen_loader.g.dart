// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "notes": "Notes",
    "addNotes": "Add notes",
    "title": "Title",
    "note": "Note",
    "add": "Add",
    "edit": "Edit",
    "delete": "Delete",
    "changeNote": "Change note",
    "change": "Change",
    "search": "Search",
    "darkTheme": "Dark Theme",
    "language": "Language"
  };
  static const Map<String, dynamic> ru = {
    "notes": "Заметки",
    "addNotes": "Добавить заметку",
    "title": "Заголовок",
    "note": "Заметка",
    "add": "Добавить",
    "edit": "Редактировать",
    "delete": "Удалить",
    "changeNote": "Изменить заметку",
    "change": "Изменить",
    "search": "Поиск",
    "darkTheme": "Темная тема",
    "language": "Язык"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "ru": ru
  };
}
