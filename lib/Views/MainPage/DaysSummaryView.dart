import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';
import 'package:weather/Models/WeatherInfo.dart';
import 'package:intl/intl.dart';
import 'package:weather/Views/SecondaryView/WeatherDayMainView.dart';

class DaysSummaryView extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  final int? day;

  const DaysSummaryView({Key? key, required this.weatherInfo, required this.day})
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
          onTap: () => //FlutterError (Could not find a generator for route RouteSettings("WeatherDayView", null) in the _WidgetsAppState
              Navigator.pushNamed(context, WeatherDayMainView.routeName,arguments: WeatherArguments(weatherInfo!, day!)),
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
            Text("${maxtemp_c.round()}\u2103 / ${mintemp_c.round()}\u2103",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ]),
        ));
  }
}
