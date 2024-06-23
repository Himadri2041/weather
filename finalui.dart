import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/main_screen.dart';
import 'package:weather_app/state.dart';
import 'package:weather_app/user_screen.dart';
import 'package:weather_app/weather_data.dart';
import 'package:weather_app/detail_screen.dart';

class finalui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mainpage()),
                  );
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => userpage()),
                  );
                },
                icon: Icon(Icons.person),
              )
            ]),
        backgroundColor: Color.fromARGB(255, 15, 1, 40),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: weatherProvider.weather != null
              ? WeatherInfo(weather: weatherProvider.weather!)
              : Center(child: Text('No weather data available')),
        ));
  }
}

class WeatherInfo extends StatelessWidget {
  final Weather weather;

  WeatherInfo({required this.weather});
  @override
  Widget build(BuildContext context) {
    String imagepath = getWeatherImagePath(weather.description);
    return Center(
        child: Column(
      children: [
        Text(weather.cityName,
            style: TextStyle(fontSize: 28, color: Colors.white)),
        Image.asset(
          imagepath,
          scale: 1.5,
          alignment: Alignment.center,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Row(children: [
            Expanded(
              child: Text(
                '${weather.temperature} C',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              weather.description,
              style: TextStyle(fontSize: 28, color: Colors.white),
            )
          ]),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                    ),
                    Text(
                      ' Min Temp',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${weather.min_temperature} C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    ' Max Temp',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 20),
                  ),
                  Text(
                    '${weather.max_temperature} C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                  child: Column(children: [
                Text(
                  ' humidity',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 20),
                ),
                Text(
                  '${weather.humidity}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )
              ])),
              Column(
                children: [
                  Text(
                    ' Pressure',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 20),
                  ),
                  Text(
                    '${weather.pressure}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }

  String getWeatherImagePath(String description) {
    if (description.toLowerCase().contains('cloud')) {
      return 'lib/images/clouds.png';
    } else if (description.toLowerCase().contains('rain')) {
      return 'lib/images/rain.png';
    } else if (description.toLowerCase().contains('thunderstorm')) {
      return 'lib/images/clouds.png';
    } else if (description.toLowerCase().contains('mist')) {
      return 'lib/images/rain.png';
    } else if (description.toLowerCase().contains('haze')) {
      return 'lib/images/rain.png';
    } else {
      return 'lib/images/sun.png';
    }
  }
}
