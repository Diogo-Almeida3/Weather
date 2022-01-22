import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';
import 'package:weather/generated/l10n.dart';

class ConditionView extends StatelessWidget {
  final WeatherArguments arguments;
  const ConditionView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).condition,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500))
          ],
        ),
        SizedBox(
          height: height * 0.0175,
        ),
        Text(
            "${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["condition"]["text"]}",
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400)),
        Transform.scale(
          scale: 1.25,
          child: Image.network("https:" +
              arguments.weatherInfo.forecast["forecastday"][arguments.day]
                  ["day"]["condition"]["icon"]),
        )
      ],
    );
  }
}
