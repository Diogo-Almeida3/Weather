import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';

class WindView extends StatelessWidget {
  final WeatherArguments arguments;
  const WindView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Vento",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.device_thermostat,
                    color: Colors.white, size: 20),
                Text(
                    "Vel: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["avgvis_km"]} km/h ",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.device_thermostat,
                    color: Colors.white, size: 20),
                Text(
                    "Ind. UV: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["uv"]} ",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
