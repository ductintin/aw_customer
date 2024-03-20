import 'package:json_annotation/json_annotation.dart';
part 'driver.g.dart';
@JsonSerializable()
class Driver{
  int? id;
  String? fullName;
  String? address;
  String? phone;
  int? status;
  String? avatar;

  Driver(this.id, this.fullName, this.address, this.phone, this.status,
      this.avatar);

  factory Driver.fromJson(Map<String, dynamic> data) => _$DriverFromJson(data);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}