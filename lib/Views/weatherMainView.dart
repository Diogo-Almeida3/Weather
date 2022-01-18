import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:weather/Models/WeatherInfo.dart';
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
    return Container(
     child: ListView(
       
       children: <Widget>[
         if(_weatherInfo != null)
            WeatherSummary(weatherInfo: _weatherInfo,)
       ],
     ),
    );
  }
}
