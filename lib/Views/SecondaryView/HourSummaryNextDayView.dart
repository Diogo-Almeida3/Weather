import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';
import 'package:intl/intl.dart';

class HourSummaryNextDayView extends StatelessWidget {
  final WeatherArguments arguments;
  final int? hour;
  const HourSummaryNextDayView(
      {Key? key, required this.arguments, required this.hour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayHour = toBeginningOfSentenceCase(DateFormat('jm').format(
        DateTime.tryParse(arguments.weatherInfo.forecast["forecastday"]
            [arguments.day]["hour"][hour]["time"])!));

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
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.network("https:" +
                  arguments.weatherInfo.forecast["forecastday"][0]["hour"][hour]
                      ["condition"]["icon"]),
            )),
        Text(
            "${arguments.weatherInfo.forecast["forecastday"][arguments.day]["hour"][hour]["temp_c"]}\u2103",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            )),
        Row(
          children: [
            const Icon(Icons.water, color: Colors.white, size: 16),
            Text(
                "${arguments.weatherInfo.forecast["forecastday"][arguments.day]["hour"][hour]["humidity"]}%",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                )),
          ],
        )
      ]),
    );
  }
}
