import 'dart:convert';
import 'dart:io';

Map<String, dynamic> jsonToMap(String path) {
  return jsonDecode(File(path).readAsStringSync());
}
