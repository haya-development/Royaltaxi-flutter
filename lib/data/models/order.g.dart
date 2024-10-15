// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      driverId: json['driver_id'] as String?,
      coupon: json['coupon'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
      rated: json['rated'] as bool?,
      rate: (json['rate'] as num?)?.toDouble(),
      status: json['status'] as String?,
      couponCode: json['coupon_code'] as String?,
      paymentType: json['payment_type'] as bool?,
      userId: json['user_id'] as String?,
      locationNameFrom: json['location_name_from'] as String?,
      locationNameTo: json['location_name_to'] as String?,
      latlangFrom: json['latlang_from'] as Map<String, dynamic>?,
      latlangTo: json['latlang_to'] as Map<String, dynamic>?,
      womenOnly: json['women_only'] as bool?,
      isInCity: json['is_in_city'] as bool?,
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      counterToCancel: (json['counter_to_cancel'] as num?)?.toInt(),
      percentApp: (json['percent_app'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'driver_id': instance.driverId,
      'coupon': instance.coupon,
      'distance': instance.distance,
      'duration': instance.duration,
      'price': instance.price,
      'price_after_discount': instance.priceAfterDiscount,
      'feedback': instance.feedback,
      'rated': instance.rated,
      'rate': instance.rate,
      'status': instance.status,
      'coupon_code': instance.couponCode,
      'payment_type': instance.paymentType,
      'user_id': instance.userId,
      'location_name_from': instance.locationNameFrom,
      'location_name_to': instance.locationNameTo,
      'latlang_from': instance.latlangFrom,
      'latlang_to': instance.latlangTo,
      'women_only': instance.womenOnly,
      'is_in_city': instance.isInCity,
      'end_date': instance.endDate?.toIso8601String(),
      'counter_to_cancel': instance.counterToCancel,
      'percent_app': instance.percentApp,
    };
