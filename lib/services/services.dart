import 'dart:convert';
import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<WeatherModel?> setServices({required String cityName}) async {
    WeatherModel? weatherService;
    try {
      String key = '9266583bb55c4b9cb4991826232304&q';
      String city = cityName;
      int day = 3;
      String root = 'http://api.weatherapi.com/v1';
      Uri url = Uri.parse('$root/forecast.json?key=$key=$city&days=$day');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);
      weatherService = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return weatherService;
  }
}
