// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Condition`
  String get condition {
    return Intl.message(
      'Condition',
      name: 'condition',
      desc: '',
      args: [],
    );
  }

  /// `Precipitation`
  String get precipitation {
    return Intl.message(
      'Precipitation',
      name: 'precipitation',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `Humidity: {humidity}%`
  String humidity(Object humidity) {
    return Intl.message(
      'Humidity: $humidity%',
      name: 'humidity',
      desc: '',
      args: [humidity],
    );
  }

  /// `Prob. Rain: {prob_rain}%`
  String prob_rain(Object prob_rain) {
    return Intl.message(
      'Prob. Rain: $prob_rain%',
      name: 'prob_rain',
      desc: '',
      args: [prob_rain],
    );
  }

  /// `Prob. Snow: {prob_snow}%`
  String prob_snow(Object prob_snow) {
    return Intl.message(
      'Prob. Snow: $prob_snow%',
      name: 'prob_snow',
      desc: '',
      args: [prob_snow],
    );
  }

  /// `{daily_temperature}℃`
  String daily_temperature(Object daily_temperature) {
    return Intl.message(
      '$daily_temperature℃',
      name: 'daily_temperature',
      desc: '',
      args: [daily_temperature],
    );
  }

  /// `{humidity_percentage}%`
  String humidity_percentage(Object humidity_percentage) {
    return Intl.message(
      '$humidity_percentage%',
      name: 'humidity_percentage',
      desc: '',
      args: [humidity_percentage],
    );
  }

  /// `{dayOfWeek}, {date}`
  String day_date(Object dayOfWeek, Object date) {
    return Intl.message(
      '$dayOfWeek, $date',
      name: 'day_date',
      desc: '',
      args: [dayOfWeek, date],
    );
  }

  /// `Temperature`
  String get temperature {
    return Intl.message(
      'Temperature',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `Maximum: {max_temperature}℃ `
  String max_temperature(Object max_temperature) {
    return Intl.message(
      'Maximum: $max_temperature℃ ',
      name: 'max_temperature',
      desc: '',
      args: [max_temperature],
    );
  }

  /// `Minimum: {min_temperature}℃`
  String min_temperature(Object min_temperature) {
    return Intl.message(
      'Minimum: $min_temperature℃',
      name: 'min_temperature',
      desc: '',
      args: [min_temperature],
    );
  }

  /// `Medium: {medium_temperature}℃`
  String medium_temperature(Object medium_temperature) {
    return Intl.message(
      'Medium: $medium_temperature℃',
      name: 'medium_temperature',
      desc: '',
      args: [medium_temperature],
    );
  }

  /// `Vel: {wind_speed} km/h `
  String wind_speed(Object wind_speed) {
    return Intl.message(
      'Vel: $wind_speed km/h ',
      name: 'wind_speed',
      desc: '',
      args: [wind_speed],
    );
  }

  /// `Ind. UV: {uv} `
  String ind_uv(Object uv) {
    return Intl.message(
      'Ind. UV: $uv ',
      name: 'ind_uv',
      desc: '',
      args: [uv],
    );
  }

  /// `{name},{region}`
  String name_region(Object name, Object region) {
    return Intl.message(
      '$name,$region',
      name: 'name_region',
      desc: '',
      args: [name, region],
    );
  }

  /// `{lat}, {lon}`
  String lat_lon(Object lat, Object lon) {
    return Intl.message(
      '$lat, $lon',
      name: 'lat_lon',
      desc: '',
      args: [lat, lon],
    );
  }

  /// `{max_temp}℃ / {min_temp}℃`
  String max_min_temp(Object max_temp, Object min_temp) {
    return Intl.message(
      '$max_temp℃ / $min_temp℃',
      name: 'max_min_temp',
      desc: '',
      args: [max_temp, min_temp],
    );
  }

  /// `{hour_temperature}℃`
  String hour_temperature(Object hour_temperature) {
    return Intl.message(
      '$hour_temperature℃',
      name: 'hour_temperature',
      desc: '',
      args: [hour_temperature],
    );
  }

  /// `Last Updated on {last_Updated}`
  String last_Updated(Object last_Updated) {
    return Intl.message(
      'Last Updated on $last_Updated',
      name: 'last_Updated',
      desc: '',
      args: [last_Updated],
    );
  }

  /// `{condition_description}`
  String condition_description(Object condition_description) {
    return Intl.message(
      '$condition_description',
      name: 'condition_description',
      desc: '',
      args: [condition_description],
    );
  }

  /// `Average temperature {average_temperature}`
  String average_temperature(Object average_temperature) {
    return Intl.message(
      'Average temperature $average_temperature',
      name: 'average_temperature',
      desc: '',
      args: [average_temperature],
    );
  }

  /// `{current_temperature}℃`
  String current_temperature(Object current_temperature) {
    return Intl.message(
      '$current_temperature℃',
      name: 'current_temperature',
      desc: '',
      args: [current_temperature],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
