import 'package:flutter/semantics.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? surname;
  String? email;
  String? password;
  List<String> assigments;
  User(
      {this.name = null,
      this.surname = null,
      this.email = null,
      this.password = null,
      this.assigments = const []});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
