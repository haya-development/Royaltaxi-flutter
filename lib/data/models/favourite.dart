import 'package:json_annotation/json_annotation.dart';
import 'package:royaltaxi/data/models/marker.dart';

part 'favourite.g.dart';

@JsonSerializable(explicitToJson: true)
class Favourite {
  String? uid;
  String? name;
  Marker? marker;

  // Constructor
  Favourite({
    this.uid,
    this.name,
    this.marker,
  });

  // Factory method to generate an instance from a JSON map
  factory Favourite.fromJson(Map<String, dynamic> json) => _$FavouriteFromJson(json);

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => _$FavouriteToJson(this);
}
