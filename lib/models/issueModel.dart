import 'package:flutter/semantics.dart';
import 'package:hospital_assignment_app_mobile/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'issueModel.g.dart';

@JsonSerializable()
class IssueModel {
  String? type;
  String? patientName;
  String? roomID;
  DateTime? time;
  User? assignedPerson;
  String? id;
  String? status;
  String? description;

  IssueModel({
    this.type = null,
    this.patientName = null,
    this.roomID = null,
    this.time = null,
    this.assignedPerson = null,
    this.id = null,
    this.status = null,
    this.description = null,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) =>
      _$IssueModelFromJson(json);
  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}
