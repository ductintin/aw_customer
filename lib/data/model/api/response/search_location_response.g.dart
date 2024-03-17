// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchLocationResponse _$SearchLocationResponseFromJson(
        Map<String, dynamic> json) =>
    SearchLocationResponse(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => SearchLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SearchLocationResponseToJson(
        SearchLocationResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions?.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };
