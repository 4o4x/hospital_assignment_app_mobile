import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/home.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/register.dart';
import 'package:hospital_assignment_app_mobile/features/auth/services/auth.dart';
import 'package:hospital_assignment_app_mobile/main.dart';
import 'package:hospital_assignment_app_mobile/models/loginModel.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
  }

  @override
  Widget build(BuildContext context) {
    LoginModel login = LoginModel();
    emailController.text = "burak@gmail.com"; // for test
    passwordController.text = "123456"; // for test
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Hospital Assigment App",
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 40,
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
                ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Please fill all the fields"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                    }

                    login.email = emailController.text;
                    login.password = passwordController.text;

                    print(login.toJson().toString());

                    Response response =
                        (await AuthServices.loginService(login));
                    if (response.statusCode != 200) {
                      print("merhaba");
                      print(
                          response.body + " " + response.statusCode.toString());
                    } else {
                      MyApp.userID = jsonDecode(response.body)["_id"];
                      print(MyApp.userID);
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      // <-- Radius
                    ),

                    minimumSize: const Size.fromHeight(40),
                    // NEW
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: mainTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                // Evaleted Button for register page button just be text
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: mainTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
