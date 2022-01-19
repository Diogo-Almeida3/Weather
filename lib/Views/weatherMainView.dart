import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:weather/Models/WeatherInfo.dart';
import 'package:weather/Models/background.dart';
import 'package:weather/Views/DaysSummaryView.dart';
import 'package:weather/Views/LocationView.dart';
import 'package:weather/Views/WeatherDescriptionView.dart';
import 'package:weather/Views/weatherSummaryView.dart';

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
  bool _serviceEnabled = false, _fetchingData = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  LocationData? _locationData;
  String? _weatherInfoUrl;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
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
        setState(() => _fetchingData = true);
        http.Response response = await http.get(Uri.parse(_weatherInfoUrl!));

        if (response.statusCode == HttpStatus.ok) {
          final Map<String, dynamic> decodedData = jsonDecode(response.body);

          setState(() => _weatherInfo = WeatherInfo.fromJson(decodedData));
        }
      } catch (ex) {
        debugPrint('Something went wrong: $ex');
      } finally {
        debugPrint(_weatherInfo.toString());
        setState(() => _fetchingData = false);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_weatherInfo == null) {
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
        body: _backgroundContainer(MainWidget(context)),
      );
    }
  }

  Widget MainWidget(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              LocationView(weatherInfo: _weatherInfo),
              const SizedBox(height: 50),
              WeatherSummary(weatherInfo: _weatherInfo),
              const SizedBox(height: 20),
              WeatherDescriptionView(weatherInfo: _weatherInfo),
              const SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DaysSummaryView(weatherInfo: _weatherInfo),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Background _backgroundContainer(Widget child) {
    const MaterialColor white = MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
        50: Color(0xFFFFFFFF),
        100: Color(0xFFFFFFFF),
        200: Color(0xFFFFFFFF),
        300: Color(0xFFFFFFFF),
        400: Color(0xFFFFFFFF),
        500: Color(0xFFFFFFFF),
        600: Color(0xFFFFFFFF),
        700: Color(0xFFFFFFFF),
        800: Color(0xFFFFFFFF),
        900: Color(0xFFFFFFFF),
      },
    );

    const MaterialColor blueRain = MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
        50: Color(0xFF0288D1),
        100: Color(0xFF0288D1),
        200: Color(0xFF0288D1),
        300: Color(0xFF0288D1),
        400: Color(0xFF0288D1),
        500: Color(0xFF0288D1),
        600: Color(0xFF0288D1),
        700: Color(0xFF0288D1),
        800: Color(0xFF0288D1),
        900: Color(0xFF0288D1),
      },
    );

    const MaterialColor night = MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
        50: Color(0xFF242F5F),
        100: Color(0xFF242F5F),
        200: Color(0xFF242F5F),
        300: Color(0xFF242F5F),
        400: Color(0xFF242F5F),
        500: Color(0xFF242F5F),
        600: Color(0xFF242F5F),
        700: Color(0xFF242F5F),
        800: Color(0xFF242F5F),
        900: Color(0xFF242F5F),
      },
    );

    Background container = Background(color: white, child: child);

    if (_weatherInfo == null) {
      container = Background(color: Colors.blueGrey, child: child);
    } else {
      if (_weatherInfo?.current["is_day"] == 1) {
        switch (_weatherInfo?.forecast["forecastday"][0]["day"]["condition"]
            ["code"]) {
          case 1000:
            container = Background(color: Colors.yellow, child: child);
            break;
          case 1003:
          case 1006:
          case 1030:
          case 1135:
          case 1147:
            container = Background(color: Colors.blueGrey, child: child);
            break;
          case 1009:
            container = Background(color: Colors.indigo, child: child);
            break;
          case 1063:
          case 1087:
          case 1117:
          case 1150:
          case 1153:
          case 1168:
          case 1171:
          case 1180:
          case 1183:
          case 1186:
          case 1189:
          case 1192:
          case 1195:
          case 1198:
          case 1201:
          case 1204:
          case 1207:
          case 1240:
          case 1243:
          case 1246:
          case 1249:
          case 1252:
          case 1273:
          case 1276:
            container = Background(color: blueRain, child: child);
            break;
          case 1066:
          case 1069:
          case 1072:
          case 1114:
          case 1210:
          case 1213:
          case 1216:
          case 1219:
          case 1222:
          case 1225:
          case 1237:
          case 1255:
          case 1258:
          case 1261:
          case 1264:
          case 1279:
          case 1282:
            container = Background(color: white, child: child);
            break;
        }
      } else {
        container = Background(color: night, child: child);
      }
    }
    return container;
  }
}
