import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/WeatherResponse.dart';

class WeatherRepository {
  final String _apiKey = 'AIzaSyDW1_9r3N2VoJOY9EUUyRwDEyrA_U20DM4';
  static const String _baseUrl = 'https://open-weather13.p.rapidapi.com/city/';

  Future<WeatherResponse> fetchWeather(String city) async {
    https://open-weather13.p.rapidapi.com/city/landon/EN
    // Define headers
    final Map<String, String> headers = {
      'x-rapidapi-key': '68e15b20aamsh74838eefa779a5fp19602bjsn03e41b67155c', // Replace with your RapidAPI key
      'x-rapidapi-host': 'open-weather13.p.rapidapi.com'
    };
    print('$_baseUrl$city/EN');
    final response = await http.get(Uri.parse('$_baseUrl$city/EN'),headers: headers);

    print("object  "+response.statusCode.toString());
    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}