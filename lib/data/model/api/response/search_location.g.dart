// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchLocation _$SearchLocationFromJson(Map<String, dynamic> json) =>
    SearchLocation(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      place_id: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structured_formatting: json['structured_formatting'] == null
          ? null
          : StructuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchLocationToJson(SearchLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'place_id': instance.place_id,
      'reference': instance.reference,
      'structured_formatting': instance.structured_formatting?.toJson(),
    };
