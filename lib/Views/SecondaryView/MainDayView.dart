import 'package:flutter/material.dart';
import 'package:weather/Models/BackgroundContainer.dart';
import 'package:weather/Models/GlassSquare.dart';
import 'package:weather/Models/WeatherArguments.dart';
import 'package:weather/Views/LocationView.dart';
import 'package:weather/Views/MainPage/LastUpdatedView.dart';
import 'package:weather/Views/SecondaryView/ConditionView.dart';
import 'package:weather/Views/SecondaryView/HourSummaryNextDayView.dart';
import 'package:weather/Views/SecondaryView/PrecipitationView.dart';
import 'package:weather/Views/SecondaryView/TemperatureView.dart';
import 'package:weather/Views/SecondaryView/WindView.dart';

class MainDayView extends StatefulWidget {
  const MainDayView({Key? key}) : super(key: key);
  static const String routeName = "WeatherDayView";
  @override
  State<StatefulWidget> createState() => _MainDayView();
}

class _MainDayView extends State<MainDayView> {
  late final WeatherArguments arguments =
      ModalRoute.of(context)!.settings.arguments as WeatherArguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //trocar a cor
            backgroundColor: Colors.amber,
            body: backgroundContainer(
                MainWidget(context), arguments.weatherInfo)));
  }

  MaterialColor blueClear = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFBBDEFB),
      100: Color(0xFFBBDEFB),
      200: Color(0xFFBBDEFB),
      300: Color(0xFFBBDEFB),
      400: Color(0xFFBBDEFB),
      500: Color(0xFFBBDEFB),
      600: Color(0xFFBBDEFB),
      700: Color(0xFFBBDEFB),
      800: Color(0xFFBBDEFB),
      900: Color(0xFFBBDEFB),
    },
  );

  Widget MainWidget(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.2;
    double width = MediaQuery.of(context).size.width * 0.425;
    return Column(
      children: [
        const SizedBox(height: 15),
        LocationView(weatherInfo: arguments.weatherInfo),
        const SizedBox(height: 15),
        Text(
            "${arguments.weatherInfo.forecast["forecastday"][arguments.day]["date"]}",
            style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: generateHours(),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GlassSquare(
                width: width,
                height: height,
                child: TemperatureView(
                  arguments: arguments,
                )),
            GlassSquare(
              width: width,
              height: height,
              child: ConditionView(
                arguments: arguments,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GlassSquare(
                width: width,
                height: height,
                child: PrecipiationView(
                  arguments: arguments,
                )),
            GlassSquare(
                width: width,
                height: height,
                child: WindView(
                  arguments: arguments,
                )),
          ],
        ),
        const SizedBox(height: 15),
        LastUpdatedView(weatherInfo: arguments.weatherInfo),
      ],
    );
  }

  List<Widget> generateHours() {
    List<Widget> _hours = List<Widget>.empty(growable: true);
    for (int i = 0; i < 24; i++) {
      _hours.add(
        HourSummaryNextDayView(
          arguments: arguments,
          hour: i,
        ),
      );
    }
    return _hours;
  }
}
