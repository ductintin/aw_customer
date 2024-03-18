

import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse{
  int? id;
  String? name;
  String? phone;
  String? address;
  String? avatar;
  String? email;
  double? averageRating;

  ProfileResponse(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address,
      required this.avatar,
      required this.email,
      required this.averageRating});

  factory ProfileResponse.fromJson(Map<String, dynamic> data) => _$ProfileResponseFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}