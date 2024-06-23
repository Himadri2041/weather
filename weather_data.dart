class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final double min_temperature;
  final double max_temperature;
  final double pressure;
  final double humidity;
  final String icon;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.min_temperature,
    required this.max_temperature,
    required this.pressure,
    required this.humidity,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      min_temperature: json['main']['temp_min'],
      max_temperature: json['main']['temp_max'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      icon: json['weather'][0]['icon'],
    );
  }
}




