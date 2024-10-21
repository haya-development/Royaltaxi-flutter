// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      file: json['file'] as String?,
      emergency: json['emergency'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
      'file': instance.file,
      'gender': instance.gender,
      'emergency': instance.emergency,
    };
