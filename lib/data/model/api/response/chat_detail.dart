import 'package:aw_customer/data/model/api/response/room.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_detail.g.dart';
@JsonSerializable(explicitToJson: true)
class ChatDetail{
  int? id;
  String? msg;
  int? receiver;
  int? sender;
  String? senderAvatar;
  int? state;
  String? timeSend;
  Room? room;

  ChatDetail(this.id, this.msg, this.receiver, this.sender, this.senderAvatar,
      this.state, this.timeSend, this.room);

  factory ChatDetail.fromJson(Map<String, dynamic> data) => _$ChatDetailFromJson(data);

  Map<String, dynamic> toJson() => _$ChatDetailToJson(this);
}