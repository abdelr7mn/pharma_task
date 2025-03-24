import 'package:flutter/material.dart';

class PatientStatusPage extends StatelessWidget {
  PatientStatusPage({Key? key}) : super(key: key);

  final List<String> statuses = [
    'Good',
    'Very Good',
    'Bad',
    'Very Good',
    'Good',

    'Very Bad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xff2C999B),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      'Over Look',
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
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: statuses.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final statusData = StatusItemData(label: statuses[index]);
                    return StatusItem(item: statusData);
                  },
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
  final StatusItemData item;
  const StatusItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(93, 193, 195, 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: item.gradient,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: item.innerCircleSize,
                height: item.innerCircleSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    item.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
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
}

class StatusItemData {
  final String label;
  late final Gradient gradient;
  final double innerCircleSize = 54.0;

  StatusItemData({required this.label}) {
    final lowerLabel = label.toLowerCase();
    if (lowerLabel == 'good' || lowerLabel == 'very good') {
      gradient = const LinearGradient(
        colors: [
          Color.fromRGBO(14, 248, 22, 1),
          Color.fromRGBO(251, 188, 4, 1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (lowerLabel == 'bad') {
      gradient = const LinearGradient(
        colors: [
          Color.fromRGBO(255, 0, 0, 1),
          Color.fromRGBO(14, 248, 22, 1),
          Color.fromRGBO(251, 188, 4, 1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (lowerLabel == 'very bad') {
      gradient = const LinearGradient(
        colors: [Color.fromRGBO(255, 0, 0, 1), Color.fromRGBO(251, 188, 4, 1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else {
      gradient = const LinearGradient(colors: [Colors.grey, Colors.grey]);
    }
  }
}
