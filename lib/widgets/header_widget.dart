import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  final bool showProfileIcons;

  const HeaderWidget({Key? key, this.showProfileIcons = true})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                'Mohamed Ahmed . . .',
                style: TextStyle(color: AppColors.lightText, fontSize: 16),
              ),
            ],
          ),
          if (showProfileIcons)
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.lightText,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.lightText,
                    size: 20,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
