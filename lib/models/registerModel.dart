import 'package:flutter/semantics.dart';
import 'package:json_annotation/json_annotation.dart';
part 'registerModel.g.dart';

@JsonSerializable()
class RegisterModel {
  String? email;
  String? password;
  String? name;
  String? surname;

  RegisterModel({
    this.email = null,
    this.password = null,
    this.name = null,
    this.surname = null,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
