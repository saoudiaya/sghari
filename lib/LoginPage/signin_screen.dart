import 'package:flutter/material.dart';
import 'package:frontend/LoginPage/entry_point.dart';
import 'package:frontend/Service/user_service.dart';
import 'package:frontend/Reusable_Widgets/reusable_widgets.dart';
import 'signup_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Column(children: [
                Image.asset("./assets/fonts/skip11.png"),
                const SizedBox(
                  height: 30,
                ),
                const Text("Welcome.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),

                const SizedBox(
                  height: 30,
                ),
                const Text("Glad to see you!", style: TextStyle(fontSize: 10)),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                reusableEmailTextField("Username", Icons.person_outline, false,
                    _emailTextController),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                reusablePasswordTextField("Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 30,
                ),
                signInSignUpButton(context, true, () {
                  if (formkey.currentState!.validate()) {
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
                  }
                }),
                signUpOption()
              ]),
            ),
          ),
        ));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account ?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Future<String> signin(
      String email, String password, BuildContext context) async {
    var url = "http://192.168.1.14:8087/users/login";
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));
    return response.body;
  }
}
