import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';
import 'package:weather/Models/WeatherInfo.dart';
import 'package:intl/intl.dart';
import 'package:weather/Views/SecondaryView/MainDayView.dart';
import 'package:weather/generated/l10n.dart';

class DaysSummaryView extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  final int? day;

  const DaysSummaryView(
      {Key? key, required this.weatherInfo, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = toBeginningOfSentenceCase(DateFormat('EEEE').format(
        DateTime.tryParse(weatherInfo?.forecast["forecastday"][day]["date"])!));

    double mintemp_c =
        weatherInfo?.forecast["forecastday"][day]["day"]["mintemp_c"];
    double maxtemp_c =
        weatherInfo?.forecast["forecastday"][day]["day"]["maxtemp_c"];

    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, MainDayView.routeName,
              arguments: WeatherArguments(weatherInfo!, day!)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(dayOfWeek ?? '',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            Padding(
                padding: const EdgeInsets.only(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image.network("https:" +
                      weatherInfo?.forecast["forecastday"][day]["day"]
                          ["condition"]["icon"]),
                )),
            Text(
                S
                    .of(context)
                    .max_min_temp(maxtemp_c.round(), mintemp_c.round()),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ]),
        ));
  }
}
