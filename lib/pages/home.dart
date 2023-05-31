import 'package:flutter/material.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/pages/search.dart';
import 'sub_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text('Weather App'), actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Search();
            }));
          },
          icon: const Icon(Icons.search),
        ),
      ]),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: RefreshProgressIndicator());
          } else if (state is Success) {
            return const SubHome();
          } else if (state is Failure) {
            return const Center(child: Text('Faild'));
          }
          return const Center(
            child: Text(
              'There Is No Weather 😢 Start Searching Now🔍',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
