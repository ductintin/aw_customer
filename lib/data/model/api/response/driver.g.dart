// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      json['id'] as int?,
      json['fullName'] as String?,
      json['address'] as String?,
      json['phone'] as String?,
      json['status'] as int?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'address': instance.address,
      'phone': instance.phone,
      'status': instance.status,
      'avatar': instance.avatar,
    };
