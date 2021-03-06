import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';
import 'package:weather/generated/l10n.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  const WeatherSummary({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.network(
                "https:" + weatherInfo?.current["condition"]["icon"]),
          ),
          Text(
            S.of(context).current_temperature(weatherInfo?.current["temp_c"]),
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            S.of(context).average_temperature(
                weatherInfo?.forecast["forecastday"][0]["day"]["avgtemp_c"]),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
