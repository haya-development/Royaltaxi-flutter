import 'package:json_annotation/json_annotation.dart';

part 'marker.g.dart';

@JsonSerializable(explicitToJson: true)
class Marker {
  String? uid;
  String? label;
  double? long;
  double? lat;

  // Constructor
  Marker({
    this.uid,
    this.label,
    this.long,
    this.lat,
  });

  // Factory method to generate an instance from a JSON map
  factory Marker.fromJson(Map<String, dynamic> json) => _$MarkerFromJson(json);

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => _$MarkerToJson(this);
}
