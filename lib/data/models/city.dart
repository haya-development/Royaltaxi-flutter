import 'package:json_annotation/json_annotation.dart';
import 'package:royaltaxi/data/models/area.dart';

part 'city.g.dart';

@JsonSerializable(explicitToJson: true)
class City {
  String? uid;
  String? label;
  List<Area>? areas;

  // Constructor
  City({
    this.uid,
    this.label,
    this.areas,
  });

  // Factory method to generate an instance from a JSON map
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
