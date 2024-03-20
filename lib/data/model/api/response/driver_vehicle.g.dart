// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverVehicle _$DriverVehicleFromJson(Map<String, dynamic> json) =>
    DriverVehicle(
      json['id'] as int?,
      json['image'] as String?,
      json['licenseNo'] as String?,
      json['name'] as String?,
      json['plate'] as String?,
      json['brand'] == null
          ? null
          : CategoryVehicle.fromJson(json['brand'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverVehicleToJson(DriverVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'licenseNo': instance.licenseNo,
      'name': instance.name,
      'plate': instance.plate,
      'brand': instance.brand?.toJson(),
    };
