// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CalanderPage extends StatelessWidget {
  const CalanderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Center(child: Text("Appointment_Page")),
        ));
  }
}
