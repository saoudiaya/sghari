import 'dart:convert';

import 'package:http/http.dart' as http;

void getNursery() async {
  var url = "http://192.168.1.14:8087/nursery/get";
  var response = await http.get(Uri.parse(url));
  var data = json.decode(response.body);
  if (response.statusCode == 200) {
    // ignore: avoid_print
    print(data);
  }
}