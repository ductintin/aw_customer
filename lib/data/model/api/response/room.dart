import 'package:aw_customer/data/model/api/response/booking_response.dart';
import 'package:aw_customer/data/model/api/response/customer_response.dart';
import 'package:aw_customer/data/model/api/response/driver.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chat_detail.dart';
part 'room.g.dart';
@JsonSerializable(explicitToJson: true)
class Room{
  int? id;
  BookingResponse? booking;
  CustomerResponse? customer;
  Driver? driver;
  int? status;
  String? timeStart;
  String? timeEnd;
  String? createdDate;
  String? modifiedDate;
  List<ChatDetail>? chatDetails;

  Room(
      this.id,
      this.booking,
      this.customer,
      this.driver,
      this.status,
      this.timeStart,
      this.timeEnd,
      this.createdDate,
      this.modifiedDate,
      this.chatDetails);

  factory Room.fromJson(Map<String, dynamic> data) => _$RoomFromJson(data);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
