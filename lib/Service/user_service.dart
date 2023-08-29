import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

Future<String> signin(
    String email, String password, BuildContext context) async {
  var url = "http://192.168.1.14:8087/users/login";
  var response = await http.post(Uri.parse(url),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"email": email, "password": password}));
  return response.body;
}

Future<String> signup(
    String firstname,
    String lastname,
    String address,
    String phonenumber,
    String email,
    String password,
    BuildContext context) async {
  var url = "http://192.168.1.14:8087/users/add";
  var response = await http.post(Uri.parse(url),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "firstname": firstname,
        "lastname": lastname,
        "address": address,
        "phonenumber": phonenumber,
        "email": email,
        "password": password
      }));
      
  return response.body;
}

  /*Future<String> signin(
      String email, String password, BuildContext context) async {
    var url = "http://192.168.1.14:8087/users/login";
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));
    return response.body;
  }*/

   /*if (formkey.currentState!.validate()) {
                    signin(_emailTextController.text,
                        _passwordTextController.text, context);
                    print('Done');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EntryPoint()));
                    // ignore: avoid_print
                  } else {
                    // ignore: avoid_print
                    print('Error !!');
                  }*/

/*
Future<void> login1(String email, String password) async {
    const url = "http://192.168.1.14:8087/users/login";
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'email': email, 'password': password});

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['success'] != null && jsonResponse['success']) {
          // Login was successful, proceed to next screen or show success message
          print('Login successful!');
        } else {
          // Login failed, display error message to user
          print('Login failed!');
        }
      } else {
        // Request failed, display error message to user
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred, display error message to user
      print('Exception occurred during login: $e');
    }
  }
*/
