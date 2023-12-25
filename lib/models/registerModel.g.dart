// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      email: json['email'] as String? ?? null,
      password: json['password'] as String? ?? null,
      name: json['name'] as String? ?? null,
      surname: json['surname'] as String? ?? null,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
    };
