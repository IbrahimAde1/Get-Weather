import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

GlobalKey<FormState> keyForm = GlobalKey();

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search A City'),
      ),
      body: Form(
        key: keyForm,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onChanged: (value) {
                cityName = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please Enter City or countery')));
                  return 'Please Enter City or countery';
                }
                return null;
              },
              onFieldSubmitted: (value) async {
                if (keyForm.currentState!.validate()) {
                  cityName = value;

                  if (cityName!.isNotEmpty) {
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!);
                    Navigator.pop(context);
                  }
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter City',
                border: const OutlineInputBorder(),
                prefixIcon: GestureDetector(
                    onTap: () async {
                      if (keyForm.currentState!.validate()) {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(cityName: cityName!);
                        Navigator.pop(context);
                      }
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
