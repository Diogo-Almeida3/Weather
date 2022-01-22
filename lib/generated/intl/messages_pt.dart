// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(average_temperature) =>
      "Temperatura Media ${average_temperature}";

  static String m1(condition_description) => "${condition_description}";

  static String m2(current_temperature) => "${current_temperature}℃";

  static String m3(daily_temperature) => "${daily_temperature}℃";

  static String m4(dayOfWeek, date) => "${dayOfWeek}, ${date}";

  static String m5(hour_temperature) => "${hour_temperature}℃";

  static String m6(humidity) => "Humidade: ${humidity}%";

  static String m7(humidity_percentage) => "${humidity_percentage}%";

  static String m8(uv) => "Ind. UV: ${uv} ";

  static String m9(last_Updated) => "Ultima Atualização em ${last_Updated}";

  static String m10(lat, lon) => "${lat}, ${lon}";

  static String m11(max_temp, min_temp) => "${max_temp}℃ / ${min_temp}℃";

  static String m12(max_temperature) => "Máxima: ${max_temperature}℃ ";

  static String m13(medium_temperature) => "Média: ${medium_temperature}℃";

  static String m14(min_temperature) => "Minima: ${min_temperature}℃";

  static String m15(name, region) => "${name},${region}";

  static String m16(prob_rain) => "Prob. Chuva: ${prob_rain}%";

  static String m17(prob_snow) => "Prob. Nevar: ${prob_snow}%";

  static String m18(wind_speed) => "Vel: ${wind_speed} km/h ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "average_temperature": m0,
        "condition": MessageLookupByLibrary.simpleMessage("Condição"),
        "condition_description": m1,
        "current_temperature": m2,
        "daily_temperature": m3,
        "day_date": m4,
        "hour_temperature": m5,
        "humidity": m6,
        "humidity_percentage": m7,
        "ind_uv": m8,
        "last_Updated": m9,
        "lat_lon": m10,
        "max_min_temp": m11,
        "max_temperature": m12,
        "medium_temperature": m13,
        "min_temperature": m14,
        "name_region": m15,
        "others": MessageLookupByLibrary.simpleMessage("Outros"),
        "precipitation": MessageLookupByLibrary.simpleMessage("Precipitação"),
        "prob_rain": m16,
        "prob_snow": m17,
        "temperature": MessageLookupByLibrary.simpleMessage("Temperatura"),
        "wind_speed": m18
      };
}
