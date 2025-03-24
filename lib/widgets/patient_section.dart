import 'package:flutter/material.dart';
import 'package:pharma/resources/app_colors.dart';

class PatientSection extends StatelessWidget {
  final VoidCallback onTap;

  const PatientSection({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.panelBackground,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white, // تحديد اللون الأبيض للحواف
              width: .6, // سمك الحواف
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Patients',
                style: TextStyle(
                  color: AppColors.lightText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_drop_down,
                  size: 35,
                  color: Color(0xff2C999B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
