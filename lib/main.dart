import 'package:flutter/material.dart';
import 'package:pharma/screens/hom_screen.dart';
import 'package:pharma/screens/patient_screen.dart';
import 'screens/add_patient_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نهض',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/patients': (context) => const PatientsScreen(),
        '/add_patient': (context) => const AddPatientScreen(),
      },
    );
  }
}
