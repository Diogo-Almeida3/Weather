import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';
import 'package:weather/Views/LocationView.dart';
import 'package:weather/Views/SecondaryView/HumidityView.dart';

class WeatherDayMainView extends StatefulWidget {
  const WeatherDayMainView({Key? key}) : super(key: key);
  static const String routeName = "WeatherDayView";
  @override
  State<StatefulWidget> createState() => _WeatherDayMainViewState();
}

class _WeatherDayMainViewState extends State<WeatherDayMainView> {
  late final WeatherArguments arguments =
      ModalRoute.of(context)!.settings.arguments as WeatherArguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //trocar a cor
      backgroundColor: Colors.amber,
      body: MainWidget(context),
    ));
  }

  Widget MainWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        LocationView(weatherInfo: arguments.weatherInfo),
        const SizedBox(height: 15),
        HumidityView(arguments: arguments),
      ],
    );
  }
}
