// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String? ?? null,
      currentService: json['currentService'] as String? ?? null,
      name: json['name'] as String? ?? null,
      surname: json['surname'] as String? ?? null,
      email: json['email'] as String? ?? null,
      password: json['password'] as String? ?? null,
      activeAssigments: (json['activeAssigments'] as List<dynamic>?)
              ?.map((e) => IssueModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'activeAssigments': instance.activeAssigments,
      'id': instance.id,
      'currentService': instance.currentService,
    };
