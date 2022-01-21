import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';

class WeatherDescriptionView extends StatelessWidget {
  final WeatherInfo? weatherInfo;

  const WeatherDescriptionView({Key? key, required this.weatherInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(weatherInfo?.current["condition"]["text"],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          )),
    );
  }
}
