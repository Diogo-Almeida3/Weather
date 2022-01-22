import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';

class PrecipiationView extends StatelessWidget {
  final WeatherArguments arguments;
  const PrecipiationView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Precipitação",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: height * 0.0175,
        ),
        Column(
          children: [
            Row(
              children: [
                const Icon(Icons.water_outlined, color: Colors.white, size: 20),
                Text(
                    "Humidade: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["avghumidity"]}%",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                const Icon(Icons.umbrella_outlined,
                    color: Colors.white, size: 20),
                Text(
                    "Pro. Chuva: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["daily_chance_of_rain"]}%",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                const Icon(Icons.ac_unit_outlined,
                    color: Colors.white, size: 20),
                Text(
                    "Pro. Neve: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["daily_chance_of_snow"]}%",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
