import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/createIssue.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/home.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/location.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/login.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/profile.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/register.dart';
import 'package:hospital_assignment_app_mobile/main.dart';
import 'package:hospital_assignment_app_mobile/models/issueModel.dart';

class TableScreen extends StatefulWidget {
  static const String routeName = "/table-screen";
  const TableScreen({Key? key}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _selectedIndex = 1; // Tracks the currently selected index

  List<IssueModel> issues = [
    IssueModel(
      type: "Cleaning",
      patientName: "Burak",
      roomID: "1",
      time: DateTime.now(),
      assignedPerson: null,
      id: "1",
      status: "Assigned",
      description: "Cleaning",
    ),
    IssueModel(
      type: "Cleaning",
      patientName: "Burak",
      roomID: "1",
      time: DateTime.now(),
      assignedPerson: null,
      id: "1",
      status: "Closed",
      description: "Cleaning",
    ),
    IssueModel(
      type: "Cleaning",
      patientName: "Burak",
      roomID: "1",
      time: DateTime.now(),
      assignedPerson: null,
      id: "1",
      status: "Open",
      description: "Cleaning",
    ),
    IssueModel(
      type: "Cleaning",
      patientName: "Burak",
      roomID: "1",
      time: DateTime.now(),
      assignedPerson: null,
      id: "1",
      status: "Revorked",
      description: "Cleaning",
    ),
    IssueModel(
      type: "Cleaning",
      patientName: "Burak",
      roomID: "1",
      time: DateTime.now(),
      assignedPerson: null,
      id: "1",
      status: "Open",
      description: "Cleaning",
    ),
    IssueModel(
      type: "Cleaning",
      patientName: "Burak",
      roomID: "1",
      time: DateTime.now(),
      assignedPerson: null,
      id: "1",
      status: "Open",
      description: "Cleaning",
    ),
    IssueModel(
      type: "Cleaning",
      patientName: "Burak",
      roomID: "1",
      time: DateTime.now(),
      assignedPerson: null,
      id: "1",
      status: "Open",
      description: "Cleaning",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      body: SafeArea(
        child: SingleChildScrollView(
          // Making the column scrollable
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LocationScreen.routeName);
                },
                child: Container(
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(24),
                    color: mainContainerColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cardiology Department",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mainTextColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "OMU Hospital",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mainTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(35),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(24),
                  color: mainContainerColor,
                ),
                child: Column(
                  children: [
                    Text(
                      "Issue Table",
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
                      color: mainTextColor,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents nested scrolling
                      itemCount:
                          issues.length, // Adjust the number of items as needed
                      itemBuilder: (context, index) {
                        final issue = issues[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // Set the color of the Card accordingly status of the issue
                          color: getColor(issue
                              .status), // Set the color of the Card accordingly status of the issue
                          child: ListTile(
                            title: Text(
                              'Patient Name: ${issue.patientName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              'Room ID: ${issue.roomID}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            trailing: Text(
                              '${DateTime.parse(issue.time.toString()).hour.toString()}:${DateTime.parse(issue.time.toString()).minute.toString()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
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
