// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      uid: json['uid'] as String?,
      label: json['label'] as String?,
      makers: (json['makers'] as List<dynamic>?)
          ?.map((e) => Marker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'uid': instance.uid,
      'label': instance.label,
      'makers': instance.makers?.map((e) => e.toJson()).toList(),
    };
