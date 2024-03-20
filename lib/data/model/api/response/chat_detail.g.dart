// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDetail _$ChatDetailFromJson(Map<String, dynamic> json) => ChatDetail(
      json['id'] as int?,
      json['msg'] as String?,
      json['receiver'] as int?,
      json['sender'] as int?,
      json['senderAvatar'] as String?,
      json['state'] as int?,
      json['timeSend'] as String?,
      json['room'] == null
          ? null
          : Room.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatDetailToJson(ChatDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'msg': instance.msg,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'senderAvatar': instance.senderAvatar,
      'state': instance.state,
      'timeSend': instance.timeSend,
      'room': instance.room?.toJson(),
    };
