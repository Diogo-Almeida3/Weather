import 'package:flutter/material.dart';
import 'package:weather/Models/Background.dart';
import 'package:weather/Models/WeatherInfo.dart';

Background backgroundContainer(Widget child, WeatherInfo _weatherInfo) {
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
      50: Color(0xFF4559b3),
      100: Color(0xFF4559b3),
      200: Color(0xFF4052a5),
      300: Color(0xFF4052a5),
      400: Color(0xFF3a4b97),
      500: Color(0xFF3a4b97),
      600: Color(0xFF2f3d7b),
      700: Color(0xFF2f3d7b),
      800: Color(0xFF242F5F),
      900: Color(0xFF242F5F),
    },
  );

  const MaterialColor blueClear = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFF42AF5F),
      100: Color(0xFF42AF5F),
      200: Color(0xFF2196F3),
      300: Color(0xFF2196F3),
      400: Color(0xFF1E88E5),
      500: Color(0xFF1E88E5),
      600: Color(0xFF1976D2),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF1565C0),
    },
  );

  Background container = Background(color: white, child: child);

  if (_weatherInfo == null) {
    container = Background(color: Colors.blueGrey, child: child);
  } else {
    if (_weatherInfo.current["is_day"] == 1) {
      switch (_weatherInfo.forecast["forecastday"][0]["day"]["condition"]
          ["code"]) {
        case 1000:
          container = Background(color: blueClear, child: child);
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
