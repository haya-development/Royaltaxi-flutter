// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      type: (json['type'] as num?)?.toInt(),
      gender: json['gender'] as bool?,
      cityId: json['city'] as String?,
      emergencyPhone: json['emergency_phone'] as String?,
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fcmToken: (json['fcmToken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      isActive: json['active'] as bool?,
      online: json['online'] as bool?,
      heading: (json['heading'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      lang: (json['lang'] as num?)?.toDouble(),
      rateGood: (json['rate_good'] as num?)?.toInt(),
      rateBad: (json['rate_bad'] as num?)?.toInt(),
      dateUpdateLocation: json['date_update_location'] == null
          ? null
          : DateTime.parse(json['date_update_location'] as String),
      wallet: (json['wallet'] as num?)?.toDouble(),
      vendorId: json['vendor_id'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'type': instance.type,
      'gender': instance.gender,
      'city': instance.cityId,
      'emergency_phone': instance.emergencyPhone,
      'favorites': instance.favorites,
      'fcmToken': instance.fcmToken,
      'image': instance.image,
      'profile': instance.profile?.toJson(),
      'active': instance.isActive,
      'online': instance.online,
      'heading': instance.heading,
      'lat': instance.lat,
      'lang': instance.lang,
      'rate_good': instance.rateGood,
      'rate_bad': instance.rateBad,
      'date_update_location': instance.dateUpdateLocation?.toIso8601String(),
      'wallet': instance.wallet,
      'vendor_id': instance.vendorId,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      publicId: json['public_id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'public_id': instance.publicId,
      'url': instance.url,
    };
