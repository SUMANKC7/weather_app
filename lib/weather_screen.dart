import 'dart:ui';


import 'package:flutter/material.dart';

import 'package:weather_app/additional_information.dart';
import 'package:weather_app/weather_forcast.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "300K",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Icon(
                            Icons.cloud,
                            size: 74,
                          ),
                          Text(
                            "Rain",
                            style: TextStyle(
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
                  WeatherForcast(time:"09:00" ,cloud: Icons.cloud,output: "320.12",),
                  WeatherForcast(time:"12:00",cloud: Icons.cloud,output: "301.54",),
                  WeatherForcast(time:"15:00",cloud: Icons.cloud,output: "310.84",),
                  WeatherForcast(time:"18:00",cloud: Icons.cloud,output: "209.14",),
                  WeatherForcast(time:"22:00",cloud: Icons.cloud,output: "332.54",),
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

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Additional_information(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "94",
                ),

                Additional_information(
                  icon: Icons.wind_power_outlined,
                  label: "Wind Speed",
                  value: "7.67",
                ),

                Additional_information(
                  icon: Icons.beach_access_sharp,
                  label: "Pressure",
                  value: "1006",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
