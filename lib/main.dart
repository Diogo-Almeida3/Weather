import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {MyHomePage.routeName: (_) => const MyHomePage(title: "WEATHER")},
      home: const MyHomePage(title: 'Weather App '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  static const String routeName = 'homescreen';
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  //Future<void> _fetchWeatherInfo() async {
  // try {} catch (ex) {
  //  debugPrint('Error in geting weather info:$ex');
  // }
  // }

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_serviceEnabled || _fetchingData)
            const CircularProgressIndicator()
          else if (_permissionStatus == PermissionStatus.denied)
            const Text("Location service not allowed")
          else if (_weatherInfo != null)
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        title: Text('Location #${index + 1}'),
                        subtitle: Text(_weatherInfo?.location["name"]),
                        onTap: () => debugPrint("Carregou em $index"),
                      ),
                  separatorBuilder: (_, __) => const Divider(
                        thickness: 2,
                      ),
                  itemCount: 3),
            )
        ],
      )),
    );
  }
}

class WeatherInfo {
  WeatherInfo.fromJson(Map<String, dynamic> json)
      : location = json['location'],
        forecast = json['forecast'],
        current = json['current'],
        alerts = json['alerts'];

  final Map location;
  final Map forecast;
  final Map current;
  final Map alerts;
}
