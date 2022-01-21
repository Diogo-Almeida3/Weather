import 'package:flutter/material.dart';
import 'package:weather/Models/GlassSquare.dart';
import 'package:weather/Models/WeatherArguments.dart';

class TemperatureView extends StatelessWidget {
  final WeatherArguments arguments;
  const TemperatureView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Temperatura",
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
                const Icon(Icons.arrow_circle_up,
                    color: Colors.white, size: 20),
                Text(
                    "Máxima: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["maxtemp_c"]}\u2103 ",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.arrow_circle_down,
                    color: Colors.white, size: 20),
                Text(
                    "Minima: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["mintemp_c"]}\u2103 ",
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
                    "Média: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["avgtemp_c"]}\u2103 ",
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
