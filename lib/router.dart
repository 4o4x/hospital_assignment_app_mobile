import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/createIssue.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/editAccount.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/home.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/login.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/register.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/table.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/profile.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/location.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const RegisterScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case CreateIssueScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const CreateIssueScreen(),
      );
    case TableScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const TableScreen(),
      );
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      );
    case LocationScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LocationScreen(),
      );
    case EditAccountScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const EditAccountScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Page Does Not Exist"),
          ),
        ),
      );
  }
}
