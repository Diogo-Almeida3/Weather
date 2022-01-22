import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';

class WindView extends StatelessWidget {
  final WeatherArguments arguments;
  const WindView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Outros",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500))
          ],
        ),
        SizedBox(
          height: height * 0.0175,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(Icons.air_outlined, color: Colors.white, size: 20),
                Text(
                    "Vel: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["avgvis_km"]} km/h ",
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
                const Icon(Icons.light_mode_outlined,
                    color: Colors.white, size: 20),
                Text(
                    "Ind. UV: ${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["uv"]} ",
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
