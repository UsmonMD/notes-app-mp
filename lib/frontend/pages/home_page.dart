import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/backend/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/frontend/components/notes_body.dart';
import 'package:notes_app/frontend/pages/search_page.dart';
import 'package:notes_app/frontend/routes/app_routes.dart';
import 'package:notes_app/frontend/style/app_style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Scaffold(
      drawer: Drawer(
        width: 300,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Container(
                  width: 260,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.darkTheme.tr(),
                          style: AppStyle.fontStyle.copyWith(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Switch(
                          value: model.isTheme,
                          onChanged: (value) {
                            model.changeTheme(value);
                          },
                          activeColor: Colors.white,
                          inactiveTrackColor: Colors.white,
                          activeTrackColor: Colors.deepPurpleAccent,
                          inactiveThumbColor: Colors.deepPurpleAccent,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 260,
                  height: 70,
                  child: FloatingActionButton(
                    backgroundColor: Colors.deepPurple,
                    onPressed: () {
                      model.changeLanguage(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.language.tr(),
                            style: AppStyle.fontStyle.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: const OpenDrawer(),
        title: Text(
          LocaleKeys.notes.tr(),
          style: AppStyle.fontStyle.copyWith(fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: const NotesBody(),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton.extended(
          heroTag: 'add-btn',
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {
            context.go(AppRoutes.addNotes);
          },
          label: const Icon(
            Icons.add_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          size: 35,
        ),
      ),
    );
  }
}
