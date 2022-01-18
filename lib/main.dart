
import 'package:flutter/material.dart';
import 'package:weather/Views/weatherMainView.dart';

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
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      home: WeatherMainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}


