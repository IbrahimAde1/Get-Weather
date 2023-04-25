import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search.dart';
import '../model/weather_model.dart';
import '../providers/provider.dart';
import 'sub_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

WeatherModel? weatherData;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: weatherData == null
          ? AppBar(
              title: const Text('Weather App'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Search();
                    }));
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            )
          : null,
      body: weatherData == null
          ? const Center(
              child: Text(
                'There Is No Weather 😢 Start Searching Now🔍',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          : const SubHome(),
    );
  }
}
