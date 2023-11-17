import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(24),
              color: mainContainerColor),
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(50),
          //color: Colors.amber[200],
          child: Column(
            children: [
              Text(
                "Selam",
                style: TextStyle(
                  color: mainTextColor,
                  fontSize: 25,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: mainTextBoxColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "E-Mail",
                    hintStyle: TextStyle(color: mainTextColor, fontSize: 12)),
                style: TextStyle(color: mainTextColor, fontSize: 12),
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: mainTextBoxColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "Password",
                    hintStyle: TextStyle(color: mainTextColor, fontSize: 12)),
                style: TextStyle(
                  color: mainTextColor,
                  fontSize: 12,
                ),
                obscureText: true,
              ),
              FilledButton(
                onPressed: () {
                  print("burak");
                  print("selam");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(mainButtonColor),
                ),
                child: Text(
                  "Login",
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
    );
  }
}

Color mainBackgroundColor = Color(0xFF151717);
Color mainContainerColor = Color(0xFF1E1E1E);
Color mainTextBoxColor = Color(0xFF333434);
Color mainButtonColor = Color(0xFF032E2C);
Color mainTextColor = Color(0xFFFFFFFF);
