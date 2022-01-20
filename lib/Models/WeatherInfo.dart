class WeatherInfo {
  WeatherInfo.fromJson(Map<String, dynamic> json)
      : location = json['location'],
        forecast = json['forecast'],
        current = json['current'],
        alerts = json['alerts'];

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'forecast': forecast,
      'current': current,
      'alerts': alerts
    };
  }

  final Map location;
  final Map forecast;
  final Map current;
  final Map alerts;
}
