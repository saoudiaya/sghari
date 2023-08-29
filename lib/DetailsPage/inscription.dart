import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/HomePage/home_screen.dart';

import '../Reusable_Widgets/reusable_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart' as ImagePicker;
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class InscriptionPage extends StatefulWidget {
  final int index;
  const InscriptionPage(this.index);
  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

enum Gender {
  boy,
  girl,
}

class _InscriptionPageState extends State<InscriptionPage> {
  final TextEditingController _imageTextController = TextEditingController();
  final TextEditingController _sicknessTextController = TextEditingController();
  final TextEditingController _firstnameTextController =
      TextEditingController();
  final TextEditingController _lastnameTextController = TextEditingController();
  final TextEditingController _birthdayTextController = TextEditingController();
  final TextEditingController _genderTextController = TextEditingController();
  List _listnursery = [];
  File? _image;
  bool _maleSelected = false;
  bool _femaleSelected = false;
  String _gender = '';

  @override
  void initState() {
    getNursery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 30,
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text("Pass your inscription.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),

                const SizedBox(
                  height: 30,
                ),
                const Text("to get started now with your best nursery!",
                    style: TextStyle(fontSize: 10)),

                // Enter first name
                const SizedBox(
                  height: 20,
                ),
                reusableNameTextField("First Name Child", Icons.person_outline,
                    false, _firstnameTextController),

                // Enter last name
                const SizedBox(
                  height: 20,
                ),
                reusableNameTextField("Last Name Child", Icons.person_outline,
                    false, _lastnameTextController),

                // Enter address
                const SizedBox(
                  height: 20,
                ),
                reusablebirthadyTextField("Birthday Child",
                    Icons.person_outline, false, _birthdayTextController),
                const SizedBox(
                  height: 20,
                ),
                const Text("Gendre Child", style: TextStyle(fontSize: 15)),
                const SizedBox(
                  height: 5,
                ),

                RadioListTile(
                  title: const Text('Boy'),
                  value: 'boy',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as String;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                RadioListTile(
                  title: const Text('Girl'),
                  value: 'girl',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as String;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                // Enter phone number
                const SizedBox(
                  height: 20,
                ),
                /*reusablegenderTextField("Gendre Child", Icons.person_outline,
                    false, _genderTextController),*/
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => _getImage(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[300],
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Image Child',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                reusablesicknessTextField(
                    "Is there anything I should know about your child's health?",
                    Icons.person_outline,
                    false,
                    _sicknessTextController),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    print('First Name: ${_firstnameTextController.text}');
                    print('Last Name: ${_lastnameTextController.text}');
                    print('Birthday: ${_birthdayTextController.text}');
                    print('Gender: $_gender');
                    print('Sickness: ${_sicknessTextController.text}');
                    print(
                        'Nursery Price: ${_listnursery[widget.index]["price"]}');
                    print(
                        'Nursery Name: ${_listnursery[widget.index]["name"]}');
                    print('Image: $_image');
                    if (formkey.currentState!.validate()) {
                      try {
                        await inscription(
                          _firstnameTextController.text,
                          _lastnameTextController.text,
                          _birthdayTextController.text,
                          _gender,
                          _sicknessTextController.text,
                          _listnursery[widget.index]["price"],
                          _listnursery[widget.index]["name_nursery"],
                          _image,
                          context,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                        print('Submitted');
                      } catch (e) {
                        print('Failed to submit data: $e');
                      }
                    } else {
                      print('Error !!');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[300],
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Inscription',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

/*Future<void> _getImage(BuildContext context) async {
  final picker = ImagePicker.ImagePicker();
  ImagePicker.XFile? pickedImage;
  await showModalBottomSheet<void>(
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.of(context).pop();
                pickedImage = await picker.pickImage(
                  source: ImagePicker.ImageSource.camera,
                );
                print('pickedImage from camera: $pickedImage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                Navigator.of(context).pop();
                pickedImage = await picker.pickImage(
                  source: ImagePicker.ImageSource.gallery,
                );
                print('pickedImage from gallery: $pickedImage');
              },
            ),
          ],
        ),
      );
    },
    context: context,
  );

  if (pickedImage != null) {
    final imagePath = pickedImage?.path;
    setState(() {
      _image = File(imagePath!);
      _imageTextController.text = imagePath;
    });
  } else {
    print('No image picked');
  }
}*/

// ...

  Future<void> _getImage(BuildContext context) async {
    const pickedImage =
        './assets/images/art.jpg'; // Replace with your static image file path

    try {
      final fileData = await rootBundle.load(pickedImage);
      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/${path.basename(pickedImage)}';
      final file = File(tempPath);
      await file.writeAsBytes(fileData.buffer.asUint8List());

      setState(() {
        _image = file;
        _imageTextController.text = pickedImage;
      });
    } catch (e) {
      print('Failed to load image: $e');
    }
  }

  Future<String> inscription(
    String firstname,
    String lastname,
    String birthday,
    String gender,
    String sikckness,
    int registration_fees,
    String name_nursery,
    File? image,
    BuildContext context,
  ) async {
    var url = "http://192.168.1.14:8087/child/add";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields.addAll(<String, String>{
      "firstname": firstname,
      "lastname": lastname,
      "birthday": birthday,
      "gender": gender,
      "sickness": sikckness,
      "name_nursery": name_nursery,
      "registration_fees": registration_fees.toString(),
    });
    if (image != null) {
      var fileStream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        fileStream,
        length,
        filename: path.basename(image.path),
      );

      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      } else {
        throw Exception('Failed to post data to server.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to connect to server. Please try again later.'),
        ),
      );
      throw e;
    }
  }

  void getNursery() async {
    var url = "http://192.168.1.14:8087/nursery/get";
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _listnursery = data;
      });
      // ignore: avoid_print
      print(data);
    }
  }
}
