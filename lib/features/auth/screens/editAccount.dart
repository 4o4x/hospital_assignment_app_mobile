import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/login.dart';
import 'package:hospital_assignment_app_mobile/models/registerModel.dart';
import 'package:http/http.dart';
import 'package:hospital_assignment_app_mobile/features/auth/services/auth.dart';
import 'package:hospital_assignment_app_mobile/main.dart';

class EditAccountScreen extends StatefulWidget {
  static const String routeName = '/editAccount-screen';
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

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
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    nameController.dispose();
    surnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RegisterModel register = RegisterModel();
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Account Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: mainButtonColor,
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(24),
                color: mainContainerColor),
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(25),

            height: 600,
            //color: Colors.amber[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Account Settings",
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 30,
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
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      fillColor: mainTextBoxColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0),
                          borderRadius: BorderRadius.circular(15)),
                      //focusColor: Colors.white38,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Name",
                      hintStyle:
                          TextStyle(color: Colors.white38, fontSize: 12)),
                  style: TextStyle(color: mainTextColor, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                      fillColor: mainTextBoxColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0),
                          borderRadius: BorderRadius.circular(15)),
                      //focusColor: Colors.white38,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Surname",
                      hintStyle:
                          TextStyle(color: Colors.white38, fontSize: 12)),
                  style: TextStyle(color: mainTextColor, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      fillColor: mainTextBoxColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0),
                          borderRadius: BorderRadius.circular(15)),
                      //focusColor: Colors.white38,
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "E-Mail",
                      hintStyle:
                          TextStyle(color: Colors.white38, fontSize: 12)),
                  style: TextStyle(color: mainTextColor, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: false,
                  controller: passwordController,
                  decoration: InputDecoration(
                      fillColor: mainTextBoxColor,
                      filled: true,
                      prefixIcon: Icon(Icons.password, color: Colors.white70),
                      //iconColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(color: Colors.white38, fontSize: 12)),
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 12,
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: false,
                  controller: repeatPasswordController,
                  decoration: InputDecoration(
                      fillColor: mainTextBoxColor,
                      filled: true,
                      prefixIcon: Icon(Icons.password, color: Colors.white70),
                      //iconColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Repeat Password",
                      hintStyle:
                          TextStyle(color: Colors.white38, fontSize: 12)),
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 12,
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    primary: mainButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        surnameController.text.isEmpty ||
                        repeatPasswordController.text.isEmpty) {
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
                    } else if (passwordController.text !=
                        repeatPasswordController.text) {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Passwords are not same"),
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
                      register.name = nameController.text;
                      register.surname = surnameController.text;
                      register.email = emailController.text;
                      register.password = passwordController.text;

                      print((register.toJson()));
                      Response response =
                          await AuthServices.registerService(register);
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
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: mainTextColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
