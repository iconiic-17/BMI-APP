import 'package:bmi_app/screens/home_screen.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/utils/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeScreen,
      routes: {
        AppRoute.homeScreen: (context) => HomeScreen(),
        AppRoute.resultScreen: (context) => ResultScreen(),
      },
    );
  }
}
