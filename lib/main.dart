import 'package:flutter/material.dart';
import 'package:lutter_health_app_ui_design/pages/health_app_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HealthAppMainPage(),
    );
  }
}
