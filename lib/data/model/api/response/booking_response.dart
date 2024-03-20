import 'package:aw_customer/data/model/api/response/booking_detail_response.dart';
import 'package:aw_customer/data/model/api/response/customer_response.dart';
import 'package:aw_customer/data/model/api/response/driver.dart';
import 'package:aw_customer/data/model/api/response/rating_response.dart';
import 'package:aw_customer/data/model/api/response/room.dart';
import 'package:aw_customer/data/model/api/response/service_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'driver_vehicle.dart';
part 'booking_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingResponse{
  int? id;
  int? state;
  String? status;
  String? createdDate;
  String? modifiedDate;
  Driver? driver;
  CustomerResponse? customer;
  ServiceResponse? service;
  String? pickupAddress;
  String? destinationAddress;
  double? pickupLat;
  double? pickupLong;
  double? destinationLat;
  double? destinationLong;
  double? distance;
  double? money;
  double? promotionMoney;
  String? code;
  List<BookingDetailResponse>? bookingDetails;
  String? customerNote;
  Room? room;
  RatingResponse? rating;
  DriverVehicle? driverVehicle;
  double? averageRating;


  BookingResponse(this.id, this.state, this.status, this.createdDate,
      this.modifiedDate, this.driver, this.customer, this.service,
      this.pickupAddress, this.destinationAddress, this.pickupLat,
      this.pickupLong, this.destinationLat, this.destinationLong, this.distance,
      this.money, this.promotionMoney, this.code, this.bookingDetails,
      this.customerNote, this.room, this.rating, this.driverVehicle,
      this.averageRating);

  factory BookingResponse.fromJson(Map<String, dynamic> data) => _$BookingResponseFromJson(data);

  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);
}