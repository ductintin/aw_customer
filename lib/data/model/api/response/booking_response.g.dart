// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      json['id'] as int?,
      json['state'] as int?,
      json['status'] as String?,
      json['createdDate'] as String?,
      json['modifiedDate'] as String?,
      json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
      json['service'] == null
          ? null
          : ServiceResponse.fromJson(json['service'] as Map<String, dynamic>),
      json['pickupAddress'] as String?,
      json['destinationAddress'] as String?,
      (json['pickupLat'] as num?)?.toDouble(),
      (json['pickupLong'] as num?)?.toDouble(),
      (json['destinationLat'] as num?)?.toDouble(),
      (json['destinationLong'] as num?)?.toDouble(),
      (json['distance'] as num?)?.toDouble(),
      (json['money'] as num?)?.toDouble(),
      (json['promotionMoney'] as num?)?.toDouble(),
      json['code'] as String?,
      (json['bookingDetails'] as List<dynamic>?)
          ?.map(
              (e) => BookingDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['customerNote'] as String?,
      json['room'] == null
          ? null
          : Room.fromJson(json['room'] as Map<String, dynamic>),
      json['rating'] == null
          ? null
          : RatingResponse.fromJson(json['rating'] as Map<String, dynamic>),
      json['driverVehicle'] == null
          ? null
          : DriverVehicle.fromJson(
              json['driverVehicle'] as Map<String, dynamic>),
      (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'driver': instance.driver?.toJson(),
      'customer': instance.customer?.toJson(),
      'service': instance.service?.toJson(),
      'pickupAddress': instance.pickupAddress,
      'destinationAddress': instance.destinationAddress,
      'pickupLat': instance.pickupLat,
      'pickupLong': instance.pickupLong,
      'destinationLat': instance.destinationLat,
      'destinationLong': instance.destinationLong,
      'distance': instance.distance,
      'money': instance.money,
      'promotionMoney': instance.promotionMoney,
      'code': instance.code,
      'bookingDetails':
          instance.bookingDetails?.map((e) => e.toJson()).toList(),
      'customerNote': instance.customerNote,
      'room': instance.room?.toJson(),
      'rating': instance.rating?.toJson(),
      'driverVehicle': instance.driverVehicle?.toJson(),
      'averageRating': instance.averageRating,
    };
