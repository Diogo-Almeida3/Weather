import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:weather/generated/l10n.dart';

class LocationView extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  const LocationView({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: new EdgeInsets.only(right: 15, left: 15),
            child: AutoSizeText(
                S.of(context).name_region(weatherInfo?.location["name"],
                    weatherInfo?.location["region"]),
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
          ),
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
                S.of(context).lat_lon(
                    weatherInfo?.location["lat"], weatherInfo?.location["lon"]),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
