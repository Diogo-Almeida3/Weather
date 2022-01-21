import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';

class ConditionView extends StatelessWidget {
  final WeatherArguments arguments;
  const ConditionView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Condição",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500))
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                const Icon(Icons.device_thermostat,
                    color: Colors.white, size: 20),
                Text(
                    "${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["condition"]["text"]}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                Image.network("https:" +
                    arguments.weatherInfo.forecast["forecastday"][arguments.day]
                        ["day"]["condition"]["icon"]),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
