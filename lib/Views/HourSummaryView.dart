import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';

import 'package:intl/intl.dart';

class HourSummaryView extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  final int? hour;
  HourSummaryView({Key? key, required this.weatherInfo, required this.hour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayHour = toBeginningOfSentenceCase(DateFormat('jm').format(
        DateTime.tryParse(
            weatherInfo?.forecast["forecastday"][0]["hour"][hour]["time"])!));
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(dayHour ?? '',
            style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
                child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.network("https:" +
                  weatherInfo?.forecast["forecastday"][0]["hour"][hour]
                      ["condition"]["icon"]),
            ))),
        Text(
            "${weatherInfo?.forecast["forecastday"][0]["hour"][hour]["temp_c"]}",
            style: const TextStyle(
              fontSize: 15
              ,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            )),
      ]),
    );
  }
}
