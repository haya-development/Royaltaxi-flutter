import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  @JsonKey(name: 'driver_id')
  String? driverId;

  String? coupon;

  double? distance;
  double? duration;
  double? price;

  @JsonKey(name: 'price_after_discount')
  double? priceAfterDiscount;

  String? feedback;
  bool? rated;
  double? rate;
  String? status;

  @JsonKey(name: 'coupon_code')
  String? couponCode;

  @JsonKey(name: 'payment_type')
  bool? paymentType;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'location_name_from')
  String? locationNameFrom;

  @JsonKey(name: 'location_name_to')
  String? locationNameTo;

  @JsonKey(name: 'latlang_from')
  Map<String, dynamic>? latlangFrom;

  @JsonKey(name: 'latlang_to')
  Map<String, dynamic>? latlangTo;

  @JsonKey(name: 'women_only')
  bool? womenOnly;

  @JsonKey(name: 'is_in_city')
  bool? isInCity;

  @JsonKey(name: 'end_date')
  DateTime? endDate;

  @JsonKey(name: 'counter_to_cancel')
  int? counterToCancel;

  @JsonKey(name: 'percent_app')
  double? percentApp;

  Order({
    this.driverId,
    this.coupon,
    this.distance,
    this.duration,
    this.price,
    this.priceAfterDiscount,
    this.feedback,
    this.rated,
    this.rate,
    this.status,
    this.couponCode,
    this.paymentType,
    this.userId,
    this.locationNameFrom,
    this.locationNameTo,
    this.latlangFrom,
    this.latlangTo,
    this.womenOnly,
    this.isInCity,
    this.endDate,
    this.counterToCancel,
    this.percentApp,
  });

  // Factory method to generate an instance from a JSON map
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
