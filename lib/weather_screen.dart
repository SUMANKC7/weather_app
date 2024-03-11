import 'package:flutter/material.dart';

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
          InkWell(
            onTap: () {
              print("Refresh");
            },
            splashColor: Colors.amber,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
