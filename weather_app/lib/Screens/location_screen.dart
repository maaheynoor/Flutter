import 'package:flutter/material.dart';
import 'package:weather_app/Services/weather.dart';
import 'package:weather_app/Utilities/constants.dart';
import 'city_screen.dart';
import 'loading_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locWeather});
  final locWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  LocationScreen locationScreenObject = new LocationScreen();
  int temp;
  String weatherIcon;
  String city;
  String weatherMessage;
  int feelsLike;

  @override
  void initState() {
    super.initState();
    updateData(widget.locWeather);
  }

  void updateData(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        city = '';
        return;
      }
      double doubleTemp = weatherData['main']['temp'];
      temp = doubleTemp.round();
      city = weatherData['name'];
      var c = weatherData['weather'][0]['id'];
      // weatherIcon = weather.getWeatherIcon(c);
      weatherMessage = weather.getMessage(temp);
      feelsLike = weatherData['main']['feels_like'].round();
      weatherIcon = weatherData['weather'][0]['icon'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_images/location.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoadingScreen();
                      }));
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData = await weather.getLocation(typedName);
                        updateData(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      '$temp °C',
                      style: kTempTextStyle,
                    ),
                    // Text(
                    //   weatherIcon,
                    //   style: kConditionTextStyle,
                    // ),
                    Container(
                        color: Colors.white24,
                        child: Image.network(
                            'http://openweathermap.org/img/wn/$weatherIcon@2x.png')),
                  ],
                ),
                Text(
                  'Feels like $feelsLike °C',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $city',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
double temp=decodeData['main']['temp'];
String city=decodeData['name'];
int condition=decodeData['weather'][0]['id'];*/
