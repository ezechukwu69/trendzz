import 'dart:convert';

Map<String, dynamic> parsejson(String value) {
  return json.decode(value);
}
