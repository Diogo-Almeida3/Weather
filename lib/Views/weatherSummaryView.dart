import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  const WeatherSummary({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                weatherInfo?.location["region"],
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "${weatherInfo?.current["temp_c"]}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.network(
                "https:" + weatherInfo?.current["condition"]["icon"]),
          )
        ],
      ),
    );
  }
}
