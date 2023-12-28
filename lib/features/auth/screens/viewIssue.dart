import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/login.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/profile.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/table.dart';
import 'package:hospital_assignment_app_mobile/models/registerModel.dart';
import 'package:http/http.dart';
import 'package:hospital_assignment_app_mobile/features/auth/services/auth.dart';
import 'package:hospital_assignment_app_mobile/main.dart';
import 'package:hospital_assignment_app_mobile/models/issueModel.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/home.dart';

class ViewIssueScreen extends StatefulWidget {
  static const String routeName = '/view-issue-screen';
  final IssueModel issue;
  const ViewIssueScreen({super.key, required this.issue});

  @override
  State<ViewIssueScreen> createState() => _ViewIssueScreenState();
}

class _ViewIssueScreenState extends State<ViewIssueScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController TypeController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController RoomIDController = TextEditingController();
  TextEditingController PatientNameController = TextEditingController();
  TextEditingController AssignedPersonController = TextEditingController();
  TextEditingController StatusController = TextEditingController();
  TextEditingController TimeController = TextEditingController();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    TypeController.dispose();
    DescriptionController.dispose();
    RoomIDController.dispose();
    PatientNameController.dispose();
    AssignedPersonController.dispose();
    StatusController.dispose();
    TimeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IssueModel issue = widget.issue;
    TypeController = TextEditingController(text: issue.type);
    DescriptionController = TextEditingController(text: issue.description);
    RoomIDController = TextEditingController(text: issue.roomID);
    PatientNameController = TextEditingController(text: issue.patientName);
    AssignedPersonController = TextEditingController(text: "null");
    TimeController = TextEditingController(text: issue.time.toString());
    StatusController = TextEditingController(text: issue.status);
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Issue', style: TextStyle(color: Colors.white)),
        backgroundColor: mainButtonColor,
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: getColor(issue.status),
                  width: 4,
                ),
                color: mainContainerColor),
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(25),

            height: 600,
            //color: Colors.amber[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Issue",
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(color: Colors.white, thickness: 2),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: TypeController,
                        decoration: InputDecoration(
                            fillColor: mainTextBoxColor,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(15)),
                            //focusColor: Colors.white38,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Type",
                            hintStyle:
                                TextStyle(color: Colors.white38, fontSize: 12)),
                        style: TextStyle(color: mainTextColor, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: PatientNameController,
                        decoration: InputDecoration(
                            fillColor: mainTextBoxColor,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(15)),
                            //focusColor: Colors.white38,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Patient Name",
                            hintStyle:
                                TextStyle(color: Colors.white38, fontSize: 12)),
                        style: TextStyle(color: mainTextColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: TimeController,
                        decoration: InputDecoration(
                            fillColor: mainTextBoxColor,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(15)),
                            //focusColor: Colors.white38,
                            prefixIcon: Icon(
                              Icons.timer_sharp,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Time",
                            hintStyle:
                                TextStyle(color: Colors.white38, fontSize: 12)),
                        style: TextStyle(color: mainTextColor, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: RoomIDController,
                        decoration: InputDecoration(
                            fillColor: mainTextBoxColor,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(15)),
                            //focusColor: Colors.white38,
                            prefixIcon: Icon(
                              Icons.room,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Room ID",
                            hintStyle:
                                TextStyle(color: Colors.white38, fontSize: 12)),
                        style: TextStyle(color: mainTextColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: AssignedPersonController,
                        decoration: InputDecoration(
                            fillColor: mainTextBoxColor,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(15)),
                            //focusColor: Colors.white38,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Assigned Person",
                            hintStyle:
                                TextStyle(color: Colors.white38, fontSize: 12)),
                        style: TextStyle(color: mainTextColor, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        //readOnly: true,
                        controller: StatusController,
                        decoration: InputDecoration(
                            //to cant write in the textfield

                            fillColor: mainTextBoxColor,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(15)),
                            //focusColor: Colors.white38,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Status",
                            hintStyle:
                                TextStyle(color: Colors.white38, fontSize: 12)),
                        style: TextStyle(color: mainTextColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: DescriptionController,
                  decoration: InputDecoration(
                      fillColor: mainTextBoxColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0),
                          borderRadius: BorderRadius.circular(15)),
                      //focusColor: Colors.white38,
                      prefixIcon: Icon(
                        Icons.description,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Description",
                      hintStyle:
                          TextStyle(color: Colors.white38, fontSize: 12)),
                  style: TextStyle(color: mainTextColor, fontSize: 12),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //size
                    minimumSize: Size(200, 50),
                    primary: mainButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    if (TypeController.text.isEmpty ||
                        DescriptionController.text.isEmpty ||
                        RoomIDController.text.isEmpty ||
                        PatientNameController.text.isEmpty ||
                        AssignedPersonController.text.isEmpty ||
                        StatusController.text.isEmpty) {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Please fill all fields"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      issue.type = TypeController.text;
                      issue.description = DescriptionController.text;
                      issue.roomID = RoomIDController.text;
                      issue.patientName = PatientNameController.text;
                      issue.assignedPerson = null;
                      issue.status = StatusController.text;
                      issue.time = DateTime.now();
                      print((issue.toJson()));

                      Response response = await AuthServices.registerService(
                          issue as RegisterModel);
                      print("response: " + response.statusCode.toString());
                      print(response
                          .body); //response.body is the response from the server
                      if (response.statusCode != 200) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Please try again later"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      }
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
