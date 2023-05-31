import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

import 'package:weather_app/pages/search.dart';
import '../../model/weather_model.dart';

class SubHome extends StatefulWidget {
  const SubHome({super.key});

  @override
  State<SubHome> createState() => _SubHomeState();
}

class _SubHomeState extends State<SubHome> {
  WeatherModel? weatherData;
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    weatherData = BlocProvider.of<WeatherCubit>(context).weather;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple], begin: Alignment.topLeft),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                weatherData!.country ?? 'Erorr conection',
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold, color: color),
                textAlign: TextAlign.center,
              ),
              Text(
                weatherData!.city ?? 'Erorr conection',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: color),
              ),
              Text(
                weatherData!.tz ?? '',
                style: TextStyle(fontSize: 15, color: color),
              ),
              Text(
                'Updated in ${weatherData!.date}',
                style: TextStyle(fontSize: 15, color: color),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${weatherData!.icon}'),
              Text(
                '${weatherData?.temp?.toInt()}°C',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: color),
              ),
              Column(
                children: [
                  Text(
                    'Max Temp ${weatherData!.maxtemp!.toInt()}°C',
                    style: TextStyle(fontSize: 15, color: color),
                  ),
                  Text(
                    'Min Temp  ${weatherData!.mintemp!.toInt()}°C',
                    style: TextStyle(fontSize: 15, color: color),
                  ),
                ],
              ),
            ],
          ),
          Text(
            textAlign: TextAlign.center,
            weatherData!.text ?? 'Erorr conection',
            style: TextStyle(fontSize: 30, color: color),
          ),
          ElevatedButton(
              style: const ButtonStyle(alignment: Alignment.center),
              child: const Text('Search 🔍'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Search();
                  }),
                );
              }),
        ],
      ),
    );
  }
}
