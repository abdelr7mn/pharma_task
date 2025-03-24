import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../models/patient.dart';
import 'package:pharma/screens/add_report.dart';

class PatientCardWidget extends StatelessWidget {
  final Patient patient;

  const PatientCardWidget({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 60,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: .6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4, top: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                Icons.person,
                                color: Colors.red,
                                size: 16,
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Dennisa Nedry',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'ID: 20254831 • Location: Assut • Age: 23',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 8,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),

                      // زر القائمة المنبثقة
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

                // الأزرار السفلية
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 18,
                        width: constraints.maxWidth * 0.35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff2C6768),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Text(
                          'Check Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const AddReport();
                            },
                          );
                        },
                        child: Container(
                          height: 18,
                          width: constraints.maxWidth * 0.35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xff2C6768),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text(
                            'Add Report',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'Good',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 6,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
