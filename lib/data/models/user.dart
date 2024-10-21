import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? uid;
  String? name;
  String? phone;
  String? file;
  String? gender;
  String? emergency;

  // Constructor
  User({
    this.uid,
    this.name,
    this.phone,
    this.gender,
    this.file,
    this.emergency,
  });

  // Factory method to generate an instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

