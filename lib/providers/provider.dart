import 'package:flutter/material.dart';

import '../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weatherService) {
    _weatherData = weatherService;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
