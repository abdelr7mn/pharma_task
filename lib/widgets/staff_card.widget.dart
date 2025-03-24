import 'package:flutter/material.dart';
import 'package:pharma/screens/add_report.dart'; // تم تصحيح الاستيراد
import '../models/patient.dart';

class StaffCardWidget extends StatelessWidget {
  final Patient patient;
  final bool isActive; // إضافة متغير لتحديد حالة الدكتور

  const StaffCardWidget({
    Key? key,
    required this.patient,
    this.isActive = true, // القيمة الافتراضية هي Active
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // استخدام أقل مساحة ممكنة
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4, top: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Image - smaller size
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            patient.profileImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.girl,
                                color: Colors.red,
                                size: 20,
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      // Patient Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Shrouck Ahmed',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ), // مسافة بين الاسم والأيقونة
                                Icon(
                                  Icons.local_activity,
                                  color: isActive ? Colors.green : Colors.red,
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      PopupMenuButton<String>(
                        color: const Color(
                          0xFF1E5A5E,
                        ), // لون الخلفية الداكنة مثل الصورة
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // زوايا مستديرة
                        ),
                        onSelected: (value) {
                          if (value == 'delete') {
                            // تنفيذ حذف العنصر
                          } else if (value == 'edit') {
                            // تنفيذ تعديل العنصر
                          }
                        },
                        itemBuilder:
                            (context) => [
                              PopupMenuItem(
                                value: 'delete',
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: 'edit',
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                        child: SizedBox(
                          width: 15,
                          height: 20,
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Action Buttons Row - more compact
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return const AddReport(); // إضافة return هنا
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
