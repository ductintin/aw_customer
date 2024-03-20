// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      json['id'] as int?,
      json['booking'] == null
          ? null
          : BookingResponse.fromJson(json['booking'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
      json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
      json['status'] as int?,
      json['timeStart'] as String?,
      json['timeEnd'] as String?,
      json['createdDate'] as String?,
      json['modifiedDate'] as String?,
      (json['chatDetails'] as List<dynamic>?)
          ?.map((e) => ChatDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'booking': instance.booking?.toJson(),
      'customer': instance.customer?.toJson(),
      'driver': instance.driver?.toJson(),
      'status': instance.status,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'chatDetails': instance.chatDetails?.map((e) => e.toJson()).toList(),
    };
