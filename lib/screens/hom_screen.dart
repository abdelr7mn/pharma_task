import 'package:flutter/material.dart';
import 'package:pharma/screens/patient_screen.dart';
import 'package:pharma/screens/patient_state.dart';
import 'package:pharma/screens/staff_screen.dart';
import 'package:pharma/widgets/patient_section.dart';
import 'package:pharma/widgets/staff_section.dart';
import '../resources/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C999B),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(height: 450, child: PatientStatusPage()),
            PatientSection(
              onTap: () => _showCustomScreenDialog(context, 'patients'),
            ),
            const SizedBox(height: 10),
            StaffSection(
              onTap: () => _showCustomScreenDialog(context, 'staff'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomScreenDialog(BuildContext context, String type) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              color: AppColors.panelBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(16),
                    ),
                    child: _buildCustomScreenContent(type),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCustomScreenContent(String type) {
    switch (type) {
      case 'patients':
        return const PatientsScreen();
      case 'staff':
        return const StaffScreen();
      default:
        return const Center(child: Text('Invalid screen type'));
    }
  }
}
