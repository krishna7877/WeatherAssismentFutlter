import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../weathercontroller/WeatherBloc.dart';
import '../weathercontroller/WeatherEvent.dart';
import '../weathercontroller/WeatherState.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final city = cityController.text;
                print(city);
                if (city.isNotEmpty) {
                  BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city));
                }else {
                  Fluttertoast.showToast(
                    msg: "Please enter a city name",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return const Center(child: Text('Enter a city to get the weather'));
                } else if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      Text(state.weather.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('${state.weather.main.temp}°C', style: const TextStyle(fontSize: 18)),
                      Text(state.weather.weather[0].description, style: const TextStyle(fontSize: 16)),
                      Image.network('https://openweathermap.org/img/wn/${state.weather.weather[0].icon}@2x.png')
                    ],
                  );
                } else if (state is WeatherError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
