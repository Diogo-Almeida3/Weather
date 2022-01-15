import 'package:flutter/material.dart';
import 'package:location/location.dart';

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
      home: const MyHomePage(title: 'Weather App '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<WeatherInfo>? _weatherInfo;

  // Location
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  LocationData? _locationData;
  String? _weatherInfoUrl;
  /*static const String _weatherInfoUrl =
      'https://api.weatherapi.com/v1/forecast.json?key=a62d114fc8f54d9dbc8153818210612&q=' +
          _locationData!.latitude +
          "," +
          _locationData!.longitude +
          '&days=3&aqi=no&alerts=yes';*/

  @override
  void initState() {
    super.initState();
    _fetchLocation();
    _getUrlWeatherLocation();
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
  }

  Future<void> _getCoordinates() async {
    _locationData = await location.getLocation();
    setState(() {});
  }

  Future<void> _getUrlWeatherLocation() async {
    if (!_serviceEnabled)
      debugPrint('Location service not enabled');
    else if (_permissionStatus == PermissionStatus.denied) {
      debugPrint('Location service not enabled');
    } else if (_locationData != null) {
      _weatherInfoUrl =
          'https://api.weatherapi.com/v1/forecast.json?key=a62d114fc8f54d9dbc8153818210612&q=' +
              _locationData!.latitude.toString() +
              "," +
              _locationData!.longitude.toString() +
              '&days=3&aqi=no&alerts=yes';
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
          if (!_serviceEnabled)
            const Text('Location service not enabled')
          else if (_permissionStatus == PermissionStatus.denied)
            const Text("Location service not allowed")
          else if (_locationData == null)
            const CircularProgressIndicator()
          else
            StreamBuilder<LocationData>(
                stream: location.onLocationChanged,
                builder: (context, snapshot) {
                  return Text(
                      'https://api.weatherapi.com/v1/forecast.json?key=a62d114fc8f54d9dbc8153818210612&q=' +
                          _locationData!.latitude.toString() +
                          "," +
                          _locationData!.longitude.toString() +
                          '&days=3&aqi=no&alerts=yes');
                }),
        ],
      )),
    );
  }
}

class WeatherInfo {
  //WeatherInfo.fromJson(Map<String, dynamic> json):

  // final String location;
}
