import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/constants/api_path.dart';
import 'package:hospital_assignment_app_mobile/models/loginModel.dart';
import 'package:hospital_assignment_app_mobile/models/registerModel.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  //Login
  static Future<http.Response> loginService(LoginModel loginModel) async {
    try {
      var url = Uri.parse("http://127.0.0.1:3000/login");

      var response = await http.post(
        url,
        body: json.encode(loginModel.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      return http.Response("request cant send", 400);
    }
  }
  // END: abpxx6d04wxr

  //Register
  // BEGIN: ed8c6549bwf9
  static Future<http.Response> registerService(
      RegisterModel registerModel) async {
    try {
      var url = Uri.parse("http://127.0.0.1:3000/register");

      print(json.encode(registerModel.toJson()));
      var response = await http.post(url,
          body: json.encode(registerModel.toJson()),
          headers: {"Content-Type": "application/json"});

      return response;
    } catch (e) {
      return http.Response("request cant send", 400);
    }
  }
  // END: ed8c6549bwf9
}
