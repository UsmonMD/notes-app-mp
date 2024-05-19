import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/frontend/routes/app_routes.dart';

class GoHome extends StatelessWidget {
  const GoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go(AppRoutes.home);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 25,
      ),
    );
  }
}
