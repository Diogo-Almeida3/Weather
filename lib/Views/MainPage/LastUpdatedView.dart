import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';
import 'package:weather/generated/l10n.dart';

class LastUpdatedView extends StatelessWidget {
  final WeatherInfo? weatherInfo;

  const LastUpdatedView({Key? key, required this.weatherInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.access_time, color: Colors.black45, size: 15),
          const SizedBox(width: 10),
          Text(
            S.of(context).last_Updated(weatherInfo?.location["localtime"]),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black45,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
