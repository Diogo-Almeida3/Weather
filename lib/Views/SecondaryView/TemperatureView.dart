import 'package:flutter/material.dart';
import 'package:weather/Models/GlassSquare.dart';
import 'package:weather/Models/WeatherArguments.dart';
import 'package:weather/generated/l10n.dart';

class TemperatureView extends StatelessWidget {
  final WeatherArguments arguments;
  const TemperatureView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).temperature,
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
          children: [
            Row(
              children: [
                const Icon(Icons.north_outlined, color: Colors.white, size: 20),
                Text(
                    S.of(context).max_temperature(
                        arguments.weatherInfo.forecast["forecastday"]
                            [arguments.day]["day"]["maxtemp_c"]),
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
                const Icon(Icons.south_outlined, color: Colors.white, size: 20),
                Text(
                    S.of(context).min_temperature(
                        arguments.weatherInfo.forecast["forecastday"]
                            [arguments.day]["day"]["mintemp_c"]),
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
                const Icon(Icons.device_thermostat,
                    color: Colors.white, size: 20),
                Text(
                    S.of(context).medium_temperature(
                        arguments.weatherInfo.forecast["forecastday"]
                            [arguments.day]["day"]["avgtemp_c"]),
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
