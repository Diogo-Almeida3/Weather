import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';

class LocationView extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  const LocationView({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("${weatherInfo?.location["name"]},${weatherInfo?.location["region"]}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 15,
              ),
              const SizedBox(width: 10),
              Text(
                "${weatherInfo?.location["lat"]}, ${weatherInfo?.location["lon"]}",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
