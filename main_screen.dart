import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/detail_screen.dart';
import 'package:weather_app/state.dart';
import 'package:weather_app/user_screen.dart';

class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'lib/images/front.png',
              scale: 1,
            ),
          ),
          Text(
            '\n\nDiscover Weather\nacross the world',
            style: TextStyle(
              
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          MaterialButton(
            shape:CircleBorder(),
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>detailpage(),
                ),
                
              );
            },
            child: Icon(Icons.arrow_forward_outlined,size:70,),
            color: Colors.black12, 
            height: 30,
            minWidth: 30,                 
          )
        ]));
  }
}
