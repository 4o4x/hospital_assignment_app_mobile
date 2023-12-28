import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/constants/api_path.dart';
import 'package:hospital_assignment_app_mobile/models/loginModel.dart';
import 'package:hospital_assignment_app_mobile/models/user.dart';
import 'package:hospital_assignment_app_mobile/models/registerModel.dart';
import 'package:http/http.dart' as http;

class EditUserServices {
  //Get user
  static Future<http.Response> getUserAccountService(
      RegisterModel registerModel, String ID) async {
    try {
      var url = Uri.parse("http://127.0.0.1:3000/getUser/$ID");
      var response = await http.post(
        url,
        body: json.encode(registerModel.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      return http.Response("request cant send", 400);
    }
  }

  //Update user
  static Future<http.Response> editUserAccountService(
      RegisterModel registerModel, String ID) async {
    try {
      var url = Uri.parse("http://127.0.0.1:3000/updateUser/$ID");
      var response = await http.post(
        url,
        body: json.encode(registerModel.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      return http.Response("request cant send", 400);
    }
  }
}
