import 'package:json_annotation/json_annotation.dart';
import 'package:royaltaxi/data/models/marker.dart';

part 'area.g.dart';

@JsonSerializable(explicitToJson: true)
class Area {
  String? uid;
  String? label;
  List<Marker>? makers;

  // Constructor
  Area({
    this.uid,
    this.label,
    this.makers,
  });

  // Factory method to generate an instance from a JSON map
  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
