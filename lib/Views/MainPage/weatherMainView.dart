import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather/Models/BackgroundContainer.dart';
import 'dart:convert';
import 'dart:io';

import 'package:weather/Models/WeatherInfo.dart';
import 'package:weather/Models/background.dart';
import 'package:weather/Views/MainPage/LastUpdatedView.dart';
import 'package:weather/Views/MainPage/DaysSummaryView.dart';
import 'package:weather/Views/MainPage/HourSummaryView.dart';
import 'package:weather/Views/LocationView.dart';
import 'package:weather/Views/MainPage/WeatherDescriptionView.dart';
import 'package:weather/Views/MainPage/weatherSummaryView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherMainView extends StatefulWidget {
  const WeatherMainView({Key? key}) : super(key: key);
  static const String routeName = "WeatherView";
  @override
  State<StatefulWidget> createState() => _WeatherMainViewState();
}

class _WeatherMainViewState extends State<WeatherMainView> {
  WeatherInfo? _weatherInfo;

  // Location
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  LocationData? _locationData;
  String? _weatherInfoUrl;
  bool ctrl = true, _ctrl1 = true;

  @override
  void initState() {
    super.initState();
    //todo vamos passar a ter aqui um le qualquer coisa das shared preferences
    _readWeatherInfo();
    //_fetchLocation();
  }

  /* Caso já exista um */
  _readWeatherInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? json = preferences.getString("Weather");

    if (json == null) {
      setState(() {
        ctrl = false;
      });
    } else {
      final Map<String, dynamic> decodedData = jsonDecode(json);
      setState(() {
        _weatherInfo = WeatherInfo.fromJson(decodedData);
      });
    }
  }

  Future<void> _fetchLocation() async {
    // Verificar estado do serviço
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    // Pede permissões em runtime
    _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
    }

    await _getCoordinates();
    await _getUrlWeatherLocation();
  }

  Future<void> _getCoordinates() async {
    _locationData = await location.getLocation();
    setState(() {});
  }

  Future<void> _getUrlWeatherLocation() async {
    if (_locationData != null) {
      _weatherInfoUrl =
          'https://api.weatherapi.com/v1/forecast.json?key=a62d114fc8f54d9dbc8153818210612&q=' +
              _locationData!.latitude.toString() +
              "," +
              _locationData!.longitude.toString() +
              '&days=3&aqi=no&alerts=yes';

      try {
        http.Response response = await http.get(Uri.parse(_weatherInfoUrl!));

        if (response.statusCode == HttpStatus.ok) {
          SharedPreferences preferences = await SharedPreferences.getInstance();

          final Map<String, dynamic> decodedData = jsonDecode(response.body);

          String sharedPreferencesData =
              jsonEncode(WeatherInfo.fromJson(decodedData));
          preferences.setString("Weather", sharedPreferencesData);

          setState(() => {
                _weatherInfo = WeatherInfo.fromJson(decodedData),
                ctrl = true,
                _ctrl1 = true
              });
        }
      } catch (ex) {
        debugPrint('Something went wrong: $ex');
      } finally {
        debugPrint(_weatherInfo.toString());
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_weatherInfo == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await _fetchLocation();
                    setState(() {});
                  },
                  child: const Text("Update Weather"))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: backgroundContainer(MainWidget(context), _weatherInfo!),
      );
    }
  }

  double turns = 0.0;
  void _changeRotation() {
    setState(() => turns += 3.14 * 2);
  }

  Widget MainWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        LocationView(weatherInfo: _weatherInfo),
        const SizedBox(height: 5),
        WeatherSummary(weatherInfo: _weatherInfo),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeatherDescriptionView(weatherInfo: _weatherInfo),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () => {
                _changeRotation(),
                setState(() {
                  _ctrl1 = !_ctrl1;
                }),
                _fetchLocation()
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(seconds: 1),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 32,
                  )),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: generateHours(),
          ),
        ),
        Wrap(
          children: generateDays(),
        ),
        LastUpdatedView(weatherInfo: _weatherInfo),
      ],
    );
  }

  List<Widget> generateDays() {
    List<Widget> _days = List<Widget>.empty(growable: true);
    for (int i = 0; i < 3; i++) {
      _days.add(
        AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: _ctrl1 ? MediaQuery.of(context).size.height * 0.085 : 0,
          curve: Curves.ease,
          duration: const Duration(seconds: 1),
          child: DaysSummaryView(
            weatherInfo: _weatherInfo,
            day: i,
          ),
        ),
      );
    }
    return _days;
  }

  List<Widget> generateHours() {
    List<Widget> _hours = List<Widget>.empty(growable: true);
    for (int i = 0; i < 24; i++) {
      _hours.add(
        HourSummaryView(
          weatherInfo: _weatherInfo,
          hour: i,
        ),
      );
    }
    return _hours;
  }
}
