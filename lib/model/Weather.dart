import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Weather {
  final String description;
  final String icon;

  Weather({required this.description, required this.icon});

   factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
   Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    description: json['description'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
  'description': instance.description,
  'icon': instance.icon,
};
