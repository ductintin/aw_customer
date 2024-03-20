
import 'package:json_annotation/json_annotation.dart';
part 'category_vehicle.g.dart';
@JsonSerializable()
class CategoryVehicle{
  int? id;
  int? kind;
  int? status;
  String? name;

  CategoryVehicle(this.id, this.kind, this.status, this.name);

  factory CategoryVehicle.fromJson(Map<String, dynamic> data) => _$CategoryVehicleFromJson(data);

  Map<String, dynamic> toJson() => _$CategoryVehicleToJson(this);
}
