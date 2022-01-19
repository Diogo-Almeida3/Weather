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

