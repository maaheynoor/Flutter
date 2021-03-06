// import 'package:flutter/material.dart';
// import '../Services/location.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// const apiKey = 'b4d891c7ec7cc70cb353582558cc3f84';

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   double lati;
//   double longi;
//   @override
//   void initState() {
//     super.initState();
//     grabCurrentLocation();
//   }

//   void grabCurrentLocation() async {
//     Location l = Location();
//     await l.grabLocation();
//     lati = l.latitude;
//     longi = l.longitude;
//     print(l.latitude);
//     print(l.longitude);
//     getData();
//   }

//   void getData() async {
//     http.Response r = await http.get(
//         'https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$longi&appid=$apiKey'); // Get method from http
//     if (r.statusCode == 200) {
//       print(r.body);
//       var data = r.body;
//       var decoded = jsonDecode(data);
//       double temp = decoded['main']['temp'];
//       String latitude = decoded['coord']['lat'];

//       print("Latitude: $latitude");
//     } else {
//       print(r.statusCode);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:flutter/material.dart';
import 'package:weather_app/Screens/location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double par1;
  double par2;
  @override
  void initState() {
    super.initState();
    grabCurrentLocationData();
  }

  void grabCurrentLocationData() async {
    WeatherModel wm = WeatherModel();
    var weatherData = await wm.getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locWeather: weatherData,
      );
    }));
    print(par1);
    print(par2);
  }

  void getDataFromLatAndLong() async {
    http.Response r = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$par1&lon=$par2&appid=$apiKey');
    if (r.statusCode == 200) {
      print(r.body);
      String data = r.body;
      var decodeData = jsonDecode(data);

      double temp = decodeData['main']['temp'];
      String city = decodeData['name'];
      int condition = decodeData['weather'][0]['id'];
      //var w=jsonDecode(data)['weather'][0]['main'];
      print(temp);
      print(condition);
      print(city);
    } else {
      print(r.statusCode);
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
