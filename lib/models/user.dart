import 'package:flutter/semantics.dart';
import 'package:hospital_assignment_app_mobile/models/issueModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? surname;
  String? email;
  String? password;
  List<IssueModel> activeAssigments;
  String? id;
  String? currentService;

  User(
      {this.id = null,
      this.currentService = null,
      this.name = null,
      this.surname = null,
      this.email = null,
      this.password = null,
      this.activeAssigments = const []});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
