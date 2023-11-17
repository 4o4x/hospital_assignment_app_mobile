import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/constants/api_path.dart';
import 'package:hospital_assignment_app_mobile/models/loginModel.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  //Login

  static Future<http.Response> loginService(LoginModel loginModel) async {
    try {
      var url = Uri.parse(ApiPath.serverIP + "login");
      var response = await http.post(url,
          body: json.encode(loginModel.toJson()), headers: null);
      return response;
    } catch (e) {
      return http.Response("request cant senf", 400);
    }
  }
}
