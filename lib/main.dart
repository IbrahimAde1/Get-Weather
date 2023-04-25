import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/provider.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const Home(),
      ),
    );
  }
}
