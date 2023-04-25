import 'package:flutter/material.dart';

class WeatherModel {
  String? city;
  String? country;
  String? tz;
  String? time;
  String? text;
  String? icon;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String? date;
  WeatherModel({
    required this.city,
    required this.date,
    required this.country,
    required this.tz,
    required this.time,
    required this.text,
    required this.icon,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
  });

  factory WeatherModel.fromjson(dynamic jesondata) {
    return WeatherModel(
      city: jesondata['location']['name'],
      date: jesondata['location']['localtime'],
      country: jesondata['location']['country'],
      tz: jesondata['location']['tz_id'],
      time: jesondata['location']['localtime'],
      text: jesondata['current']['condition']['text'],
      icon: jesondata['current']['condition']['icon'],
      temp: jesondata['current']['temp_c'],
      maxtemp: jesondata['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: jesondata['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
