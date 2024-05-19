import 'package:flutter/material.dart';
import 'package:notes_app/frontend/style/app_colors.dart';
import 'package:notes_app/frontend/style/app_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.title = '',
    this.text = '',
    this.date = '',
    this.isActive = false,
  });

  final String title, text, date;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: AppColors.black.withOpacity(0.3),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                backgroundColor:
                    isActive ? Colors.yellow.withOpacity(0.3) : null,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
