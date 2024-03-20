import 'package:aw_customer/data/model/api/response/category_vehicle.dart';
import 'package:json_annotation/json_annotation.dart';
part 'driver_vehicle.g.dart';
@JsonSerializable(explicitToJson: true)
class DriverVehicle{
  int? id;
  String? image;
  String? licenseNo;
  String? name;
  String? plate;
  CategoryVehicle? brand;

  DriverVehicle(
      this.id, this.image, this.licenseNo, this.name, this.plate, this.brand);

  factory DriverVehicle.fromJson(Map<String, dynamic> data) => _$DriverVehicleFromJson(data);

  Map<String, dynamic> toJson() => _$DriverVehicleToJson(this);
}