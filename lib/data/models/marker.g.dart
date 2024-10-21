// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Marker _$MarkerFromJson(Map<String, dynamic> json) => Marker(
      uid: json['uid'] as String?,
      label: json['label'] as String?,
      long: (json['long'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MarkerToJson(Marker instance) => <String, dynamic>{
      'uid': instance.uid,
      'label': instance.label,
      'long': instance.long,
      'lat': instance.lat,
    };
