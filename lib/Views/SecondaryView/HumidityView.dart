import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherArguments.dart';

class HumidityView extends StatelessWidget {
  final WeatherArguments arguments;
  const HumidityView({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.blue)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.water, color: Colors.white, size: 20),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Humidade",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500))
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "${arguments.weatherInfo.forecast["forecastday"][arguments.day]["day"]["avghumidity"]}%",
                    style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ));
  }
}
