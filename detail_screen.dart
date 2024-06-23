import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/finalui.dart';
import 'package:weather_app/state.dart';
import 'package:weather_app/user_screen.dart';
import 'package:weather_app/weather_data.dart';

class detailpage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherProvider weatherProvider = WeatherProvider();
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => userpage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await Provider.of<WeatherProvider>(context, listen: false)
                    .fetchWeather(_controller.text);
                if (Provider.of<WeatherProvider>(context, listen: false)
                        .weather !=
                    null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => finalui(),
                    ),
                  );
                }
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.loading) {
                  return CircularProgressIndicator();
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
