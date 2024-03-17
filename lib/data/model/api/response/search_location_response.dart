import 'package:aw_customer/data/model/api/response/search_location.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_location_response.g.dart';
@JsonSerializable(explicitToJson: true)
class SearchLocationResponse{
  List<SearchLocation>? predictions;
  String? status;

  SearchLocationResponse({
    required this.predictions, required this.status});

  factory SearchLocationResponse.fromJson(Map<String, dynamic> data) => _$SearchLocationResponseFromJson(data);

  Map<String, dynamic> toJson() => _$SearchLocationResponseToJson(this);
}