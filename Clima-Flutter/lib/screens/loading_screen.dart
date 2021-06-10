import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1');
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      int temperature = decodedData['main']['temp'];
      double condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['weather'][0]['id'];
      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
