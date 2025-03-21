import 'package:flutter/material.dart';

class PatientStatusPage extends StatelessWidget {
  const PatientStatusPage({super.key});

  final List<String> statuses = const [
    'Good',
    'Good',
    'Very Good',
    'Good',
    'Bad',
    'Very Good',
    'Good',
    'Good',
    'Very Bad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
            height: 400, // زيادة الارتفاع لاستيعاب العنوان
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff2C999B),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                // العنوان
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '----->Overall Look<-----',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // الـ GridView
                Expanded(
                  child: GridView.builder(
                    itemCount: statuses.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return StatusItem(status: statuses[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String status;

  const StatusItem({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF5DC1C3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: _getGradient(status),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    status,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Gradient _getGradient(String status) {
    switch (status.toLowerCase()) {
      case 'good':
      case 'very good':
        return const LinearGradient(
          colors: [Color(0xFF0EF816), Color(0xFFFBBC04)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'bad':
        return const LinearGradient(
          colors: [Color(0xFFFF0000), Color(0xFF0EF816), Color(0xFFFBBC04)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'very bad':
        return const LinearGradient(
          colors: [Color(0xFFFF0000), Color(0xFFFBBC04)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Colors.grey, Colors.grey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }
}