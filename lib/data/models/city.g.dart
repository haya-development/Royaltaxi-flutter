// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      uid: json['uid'] as String?,
      label: json['label'] as String?,
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'uid': instance.uid,
      'label': instance.label,
      'areas': instance.areas?.map((e) => e.toJson()).toList(),
    };
