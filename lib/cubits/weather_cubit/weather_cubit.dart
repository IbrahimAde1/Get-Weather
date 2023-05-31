import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/model/weather_model.dart';

import '../../services/services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(Initial());
  Services weatherService;
  WeatherModel? weather;
  void getWeather({required String cityName}) async {
    emit(Loading());
    try {
      weather = await weatherService.setServices(cityName: cityName);
      emit(Success());
    } catch (e) {
      emit(Failure());
    }
  }
}
