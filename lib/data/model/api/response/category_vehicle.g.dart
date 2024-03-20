// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryVehicle _$CategoryVehicleFromJson(Map<String, dynamic> json) =>
    CategoryVehicle(
      json['id'] as int?,
      json['kind'] as int?,
      json['status'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoryVehicleToJson(CategoryVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'status': instance.status,
      'name': instance.name,
    };
