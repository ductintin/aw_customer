import 'package:aw_customer/data/model/api/response/structured_formatting.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_location.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchLocation{
  String? id;
  String? name;
  String? address;
  String? description;
  String? place_id;
  String? reference;
  StructuredFormatting? structured_formatting;

  SearchLocation(
      {required this.id,
      required this.name,
      required this.address,
      required this.description,
      required this.place_id,
      required this.reference,
      required this.structured_formatting});

  factory SearchLocation.fromJson(Map<String, dynamic> data) => _$SearchLocationFromJson(data);

  Map<String, dynamic> toJson() => _$SearchLocationToJson(this);
}