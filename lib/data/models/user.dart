import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? uid;
  String? name;
  String? phone;
  String? email;
  int? type;
  bool? gender;

  @JsonKey(name: 'city')
  String? cityId;

  @JsonKey(name: 'emergency_phone')
  String? emergencyPhone;

  List<String>? favorites;
  List<String>? fcmToken;

  String? image;

  Profile? profile;

  @JsonKey(name: 'active')
  bool? isActive;

  bool? online;
  double? heading;
  double? lat;
  double? lang;

  @JsonKey(name: 'rate_good')
  int? rateGood;

  @JsonKey(name: 'rate_bad')
  int? rateBad;

  @JsonKey(name: 'date_update_location')
  DateTime? dateUpdateLocation;

  double? wallet;

  @JsonKey(name: 'vendor_id')
  String? vendorId;

  // Constructor
  User({
    this.uid,
    this.name,
    this.phone,
    this.email,
    this.type,
    this.gender,
    this.cityId,
    this.emergencyPhone,
    this.favorites,
    this.fcmToken,
    this.image,
    this.profile,
    this.isActive,
    this.online,
    this.heading,
    this.lat,
    this.lang,
    this.rateGood,
    this.rateBad,
    this.dateUpdateLocation,
    this.wallet,
    this.vendorId,
  });

  // Factory method to generate an instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Profile {
  @JsonKey(name: 'public_id')
  String? publicId;
  String? url;

  Profile({this.publicId, this.url});

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
