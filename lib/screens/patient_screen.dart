import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../models/patient.dart';
import '../widgets/header_widget.dart';
import '../widgets/patient_card_widget.dart';
import 'add_patient_screen.dart'; // تأكد من استيراد شاشة AddPatientScreen

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final patients = Patient.getDummyPatients();
    final double itemAspectRatio = 149 / 47;

    return Scaffold(
      backgroundColor: const Color(0xff2C999B),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuart,
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_isExpanded ? 16 : 0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.white, // لون الخط
                    thickness: 2, // سمك الخط
                    endIndent: 8, // مسافة بعد الخط
                  ),
                ),
                const Text(
                  'My Patients',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 8, // مسافة قبل الخط
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.lightText,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // عرض عنصر واحد في كل صف
                  crossAxisSpacing: 10, // المسافة الأفقية بين العناصر
                  mainAxisSpacing: 10, // المسافة الرأسية بين الصفوف
                  childAspectRatio:
                      itemAspectRatio, // نسبة العرض للارتفاع (149/47)
                ),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return PatientCardWidget(patient: patients[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddPatientScreen(); // إضافة return هنا
            },
          );
        },
        backgroundColor: AppColors.lightText,
        child: const Icon(Icons.add, color: AppColors.primary),
      ),
    );
  }
}
