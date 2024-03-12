import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:weather_app/additional_information.dart';
import 'package:weather_app/weather_forcast.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=14bf04f3380b908743fd835a245c8d4e"),
      );
      final data = jsonDecode(res.body);
      if (data["cod"] != "200") {
        throw "An unexpected error occurred";
      }
      return data;
      // temp = data["list"][0]["main"]["temp"];
      // temp = temp - 274.15;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.3,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            highlightColor: const Color.fromARGB(255, 128, 224, 250),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;
          final currentWeatherData = data["list"][0];
          final currentTemp = currentWeatherData["main"]["temp"] - 274.15;
          final currentSky = currentWeatherData["weather"][0]["main"];
          final currentPressure = currentWeatherData["main"]["pressure"];
          final currentWindSpeed = currentWeatherData["wind"]["speed"];
          final currentHumidity = currentWeatherData["main"]["humidity"];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "${currentTemp.toStringAsFixed(2)}°C ",
                                style: const TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              Icon(
                                currentSky == "Clouds" || currentSky == "Rain"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 74,
                              ),
                              Text(
                                currentSky,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Weather Forcast",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //scroll view
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      WeatherForcast(
                        time: "09:00",
                        cloud: Icons.cloud,
                        output: "320.12",
                      ),
                      WeatherForcast(
                        time: "12:00",
                        cloud: Icons.sunny,
                        output: "301.54",
                      ),
                      WeatherForcast(
                        time: "15:00",
                        cloud: Icons.cloud,
                        output: "310.84",
                      ),
                      WeatherForcast(
                        time: "18:00",
                        cloud: Icons.sunny_snowing,
                        output: "209.14",
                      ),
                      WeatherForcast(
                        time: "22:00",
                        cloud: Icons.cloud,
                        output: "332.54",
                      ),
                    ],
                  ),
                ),

                //Additional Information
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Additional Information",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Additional_information(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: currentHumidity.toString(),
                    ),
                    Additional_information(
                      icon: Icons.wind_power_outlined,
                      label: "Wind Speed",
                      value: "${currentWindSpeed.toString()}  ",
                    ),
                    Additional_information(
                      icon: Icons.beach_access_sharp,
                      label: "Pressure",
                      value:"${ currentPressure.toString()} ",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
