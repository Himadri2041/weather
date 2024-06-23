import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/main_screen.dart';
import 'state.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child:MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WEATHER FORECAST',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: mainpage(),
    );
  }
}
