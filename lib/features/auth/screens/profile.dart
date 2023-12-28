import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/createIssue.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/editAccount.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/home.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/location.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/login.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/table.dart';
import 'package:hospital_assignment_app_mobile/main.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else if (_selectedIndex == 1) {
        Navigator.pushNamed(context, TableScreen.routeName);
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, CreateIssueScreen.routeName);
      } else if (_selectedIndex == 3) {
        Navigator.pushNamed(context, ProfileScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(24),
                color: mainContainerColor),
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(25),

            height: 400,
            //color: Colors.amber[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: mainTextBoxColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Account Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () => {
                      Navigator.pushNamed(context, EditAccountScreen.routeName)
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: mainTextBoxColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Location Change",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () => {
                      Navigator.pushNamed(context, LocationScreen.routeName)
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Color(int.parse("0xFF902330")),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: ListTile(
                    trailing: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      print(MyApp.userID);
                      MyApp.userID = null;
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFF151717)),
          BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              label: 'Issue Table',
              backgroundColor: Color(0xFF151717)),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Create Issue',
            backgroundColor: Color(0xFF151717),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color(0xFF151717)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
