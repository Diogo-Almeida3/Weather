import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather/Views/MainPage/weatherMainView.dart';
import 'package:weather/Views/SecondaryView/MainDayView.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (_) => const MyHomePage(title: "WEATHER"),
        MainDayView.routeName: (_) => const MainDayView(),
      },
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
    return const SafeArea(child: WeatherMainView());
  }
}
