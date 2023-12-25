// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issueModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) => IssueModel(
      type: json['type'] as String? ?? null,
      patientName: json['patientName'] as String? ?? null,
      roomID: json['roomID'] as String? ?? null,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      assignedPerson: json['assignedPerson'] == null
          ? null
          : User.fromJson(json['assignedPerson'] as Map<String, dynamic>),
      id: json['id'] as String? ?? null,
      status: json['status'] as String? ?? null,
      description: json['description'] as String? ?? null,
    );

Map<String, dynamic> _$IssueModelToJson(IssueModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'patientName': instance.patientName,
      'roomID': instance.roomID,
      'time': instance.time?.toIso8601String(),
      'assignedPerson': instance.assignedPerson,
      'id': instance.id,
      'status': instance.status,
      'description': instance.description,
    };
