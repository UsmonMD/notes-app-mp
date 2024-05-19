import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/backend/hive/hive_box.dart';
import 'package:notes_app/backend/hive/notes_data.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/frontend/components/card_widget.dart';
import 'package:notes_app/frontend/style/app_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  final notes = HiveBoxes.notes.values.toList();
  var filteredNotes = <NotesData>[];

  bool isColor = false;

  void searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = notes.where((noteList) {
        return noteList.title.toLowerCase().contains(query.toLowerCase()) ||
            noteList.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
      isColor = true;
    } else {
      filteredNotes = notes;
      isColor = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredNotes = notes;
    searchController.addListener(searchNotes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          style: AppStyle.fontStyle,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: '${LocaleKeys.search.tr()}...',
            hintStyle: AppStyle.fontStyle,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                searchController.clear();
              },
              icon: const Icon(
                Icons.close,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NotesData> box, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.separated(
              itemBuilder: (context, i) {
                final note = filteredNotes[i];
                return CardWidget(
                  title: note.title,
                  date: note.date,
                  text: note.text,
                  isActive: isColor,
                );
              },
              separatorBuilder: (context, i) => const SizedBox(height: 16),
              itemCount: filteredNotes.length,
            ),
          );
        },
      ),
    );
  }
}
