import 'package:flutter/material.dart';
import 'package:frontend/Reusable_Widgets/reusable_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _firstnameTextController =
      TextEditingController();
  final TextEditingController _lastnameTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _phonenumberTextController =
      TextEditingController();
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
                const Text("Create Account.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),

                const SizedBox(
                  height: 30,
                ),
                const Text("to get started now!",
                    style: TextStyle(fontSize: 10)),

                // Enter first name
                const SizedBox(
                  height: 20,
                ),
                reusableNameTextField("First Name", Icons.person_outline, false,
                    _firstnameTextController),

                // Enter last name
                const SizedBox(
                  height: 20,
                ),
                reusableNameTextField("Last Name", Icons.person_outline, false,
                    _lastnameTextController),

                // Enter address
                const SizedBox(
                  height: 20,
                ),
                reusableAddressTextField("Address", Icons.person_outline, false,
                    _addressTextController),

                // Enter phone number
                const SizedBox(
                  height: 20,
                ),
                reusablePhoneTextField("Phone Number", Icons.person_outline,
                    false, _phonenumberTextController),

                // Enter email
                const SizedBox(
                  height: 20,
                ),
                reusableEmailTextField("Username", Icons.person_outline, false,
                    _emailTextController),

                // Enter password
                const SizedBox(
                  height: 20,
                ),
                reusablePasswordTextField("Password", Icons.lock_outline, true,
                    _passwordTextController),

                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  if (formkey.currentState!.validate()) {
                    signup(
                        _firstnameTextController.text,
                        _lastnameTextController.text,
                        _addressTextController.text,
                        _phonenumberTextController.text,
                        _emailTextController.text,
                        _passwordTextController.text,
                        context);
                    print('Submited');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                    // ignore: avoid_print
                  } else {
                    // ignore: avoid_print
                    print('Error !!');
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
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
}
