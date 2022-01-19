import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherInfo.dart';
import 'package:intl/intl.dart';

class DaysSummaryView extends StatelessWidget {
  final WeatherInfo? weatherInfo;

  DaysSummaryView({Key? key, @required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = toBeginningOfSentenceCase(DateFormat('EEE')
        .format(DateTime.tryParse(weatherInfo?.location["localtime"])!));

    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(dayOfWeek ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              Text("${weatherInfo?.current["temp_c"]}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ]),
            Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image.network(
                          "https:" + weatherInfo?.current["condition"]["icon"]),
                    )))
          ],
        ));
  }
}
