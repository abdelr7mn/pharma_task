import 'package:flutter/material.dart';
import 'package:pharma/screens/add_staff_screen.dart';
import '../resources/app_colors.dart';
import '../models/patient.dart';
import '../widgets/header_widget.dart';
import '../widgets/patient_card_widget.dart';
import 'package:pharma/widgets/staff_card.widget.dart';
import 'package:pharma/screens/add_patient_screen.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({Key? key}) : super(key: key);

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
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
      backgroundColor: Color(0xff2C999B),
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
                    color: Colors.white,
                    thickness: 2,
                    endIndent: 8,
                  ),
                ),
                const Text(
                  'My Staff',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Expanded(
                  child: Divider(color: Colors.white, thickness: 2, indent: 8),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  crossAxisCount: 1, // عرض اثنين في كل صف
                  crossAxisSpacing: 5, // المسافة الأفقية بين العناصر
                  mainAxisSpacing: 5, // المسافة الرأسية بين الصفوف
                  childAspectRatio:
                      itemAspectRatio, // نسبة العرض للارتفاع (149/47)
                ),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  // استخدام SizedBox لضبط الحجم بدقة
                  return SizedBox(
                    width: 100,
                    height: 10,
                    child: StaffCardWidget(patient: patients[index]),
                  );
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

            backgroundColor: Colors.transparent, // يجعل الخلفية شفافة
            builder: (context) {
              return Center(
                child: Container(
                  width:
                      MediaQuery.of(context).size.width *
                      0.9, // يجعل العرض 90% من الشاشة
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xff2C999B), // لون الخلفية
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ), // يجعل الحواف دائرية
                  ),
                  child: AddStaffScreen(),
                ),
              );
            },
          );
        },
        backgroundColor: AppColors.lightText,
        child: const Icon(Icons.add, color: AppColors.primary),
      ),
    );
  }
}
