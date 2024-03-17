import 'package:json_annotation/json_annotation.dart';
part 'structured_formatting.g.dart';

@JsonSerializable()
class StructuredFormatting{
  String? main_text;
  String? secondary_text;

  StructuredFormatting({required this.main_text, required this.secondary_text});

  factory StructuredFormatting.fromJson(Map<String, dynamic> data) => _$StructuredFormattingFromJson(data);

  Map<String, dynamic> toJson() => _$StructuredFormattingToJson(this);
}