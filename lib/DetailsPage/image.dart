import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImagePage extends StatefulWidget {
  ImagePage();

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late Uint8List _imageBytes;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getImageBytes();
  }

  Future<void> _getImageBytes() async {
    var url = "http://192.168.1.14:8087/child/get";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var imageString = data[0]['image'];
      var imageBytes = base64.decode(imageString);
      await Future.delayed(Duration(seconds: 1)); // wait for 1 second
      setState(() {
        _imageBytes = imageBytes;
        _loading = false; // set loading flag to false
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator() // show progress indicator if still loading
            : Image.memory(_imageBytes), // show image if loaded
      ),
    );
  }
}
