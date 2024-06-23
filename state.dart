
import 'package:flutter/material.dart';
import 'weather_data.dart';
import 'fetch_data.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _loading = false;
  final WeatherService _weatherService = WeatherService();

  Weather? get weather => _weather;
  bool get loading => _loading;

  Future<void> fetchWeather(String cityName) async {
    _loading = true;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(cityName);
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
