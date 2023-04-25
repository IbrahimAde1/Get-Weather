import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search.dart';
import '../../model/weather_model.dart';
import '../../providers/provider.dart';

class SubHome extends StatefulWidget {
  const SubHome({super.key});

  @override
  State<SubHome> createState() => _SubHomeState();
}

class _SubHomeState extends State<SubHome> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                weatherData!.country ?? 'Erorr conection',
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                weatherData!.city ?? 'Erorr conection',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                weatherData!.tz ?? '',
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                'Updated in ${weatherData!.date}',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${weatherData!.icon}'),
              Text(
                '${weatherData?.temp?.toInt()}°C',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    'Max Temp ${weatherData!.maxtemp!.toInt()}°C',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Min Temp  ${weatherData!.mintemp!.toInt()}°C',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          Text(
            weatherData!.text ?? 'Erorr conection',
            style: const TextStyle(
              fontSize: 30,
            ),
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
          const Text(
            '‟By: Ibrahim Adel”',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Sigmar',
            ),
          ),
        ],
      ),
    );
  }
}
