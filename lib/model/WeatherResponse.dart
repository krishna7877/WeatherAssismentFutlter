import 'package:json_annotation/json_annotation.dart';

import 'Weather.dart';


@JsonSerializable()
class WeatherResponse {
  final String name;
  final Main main;
  final List<Weather> weather;

  WeatherResponse({required this.name, required this.main, required this.weather});

   factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
   Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class Main {
  final double temp;

  Main({required this.temp});

   factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
   Map<String, dynamic> toJson() => _$MainToJson(this);
}

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    name: json['name'] as String,
    main: Main.fromJson(json['main'] as Map<String, dynamic>),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'main': instance.main,
      'weather': instance.weather,
    };

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    temp: (json['temp'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
  'temp': instance.temp,
};