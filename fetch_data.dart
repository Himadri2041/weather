import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_data.dart';

class WeatherService {
final String apiKey = '839a7be3e019d6f67a8c8600983d9d53';
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String cityName) async {
    final url = '$apiUrl?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load weather:${response.reasonPhrase}');
    }
  }
}
