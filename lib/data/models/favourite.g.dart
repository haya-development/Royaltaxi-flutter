// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favourite _$FavouriteFromJson(Map<String, dynamic> json) => Favourite(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      marker: json['marker'] == null
          ? null
          : Marker.fromJson(json['marker'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavouriteToJson(Favourite instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'marker': instance.marker?.toJson(),
    };
