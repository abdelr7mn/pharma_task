import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../models/patient.dart';
import 'package:pharma/screens/add_report.dart'; // تم تصحيح الاستيراد

class PatientCardWidget extends StatelessWidget {
  final Patient patient;

  const PatientCardWidget({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use minimum space needed
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row with patient info
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
                          child: Image.network(
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

                      // Patient Info
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

                            // Use a more compact format for the details
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

                      // More Button - smaller
                      SizedBox(
                        width: 15,
                        height: 20,
                        child: IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 16,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 2),

                // Action Buttons Row - more compact
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Check Profile Button - fixed width instead of Expanded
                      Container(
                        height: 18,
                        width: constraints.maxWidth * 0.35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff2C6768),
                          borderRadius: BorderRadius.circular(9),
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

                      // Add Report Button - fixed width
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30), // زاوية علوية يسرى مدورة
                                topRight: Radius.circular(30),// زاوية علوية يمينية مدورة
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const AddReport(); // إضافة return هنا
                            },
                          );
                        },
                        child: Container(
                          height: 18,
                          width: constraints.maxWidth * 0.35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xff2C6768),
                            borderRadius: BorderRadius.circular(9),
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

                      // Saved Button (Circle) - smaller
                      Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'Saved',
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