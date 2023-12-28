import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/login.dart';
import 'package:hospital_assignment_app_mobile/router.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/register.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  static var userID;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: (settings) => generateRoute(settings),
        home: LoginScreen());
  }
}

Color getColor(String? status) {
  if (status == "Open") {
    return Color(0xFFBF3143);
  } else if (status == "Closed") {
    return Color(0xFF185A16);
  } else if (status == "Assigned") {
    return Color(0xFFB8A201);
  } else if (status == "Revorked") {
    return Color(0xFFB20870);
  } else {
    return Colors.white;
  }
}

Color mainBackgroundColor = Color(0xFF151717);
Color mainContainerColor = Color(0xFF1E1E1E);
Color mainTextBoxColor = Color(0xFF333434);
Color mainButtonColor = Color(0xFF032E2C);
Color mainTextColor = Color(0xFFFFFFFF);
