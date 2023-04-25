import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/pages/home.dart';
import '../providers/provider.dart';
import '../services/services.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search A City'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                cityName = value;
              },
              onSubmitted: (value) async {
                cityName = value;
                Services service = Services();
                WeatherModel? weather =
                    await service.setServices(cityName: cityName!);
                // ignore: use_build_context_synchronously
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                // ignore: use_build_context_synchronously
                // weatherData?.city == null
                //     ?
                //     :
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'Enter City',
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                prefixIcon: GestureDetector(
                    onTap: () async {
                      // cityName = value;
                      Services service = Services();
                      WeatherModel? weather =
                          await service.setServices(cityName: cityName!);
                      // ignore: use_build_context_synchronously
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.search)),
                labelText: 'Search',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
