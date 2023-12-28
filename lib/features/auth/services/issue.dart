import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/constants/api_path.dart';
import 'package:hospital_assignment_app_mobile/models/issueModel.dart';
import 'package:hospital_assignment_app_mobile/models/loginModel.dart';
import 'package:hospital_assignment_app_mobile/models/registerModel.dart';
import 'package:http/http.dart' as http;

class IssueServices {
  //Login
  static Future<http.Response> createIssueService(IssueModel issue) async {
    try {
      var url = Uri.parse("http://127.0.0.1:3000/create");

      var response = await http.post(
        url,
        body: json.encode(issue.toJson()),
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
