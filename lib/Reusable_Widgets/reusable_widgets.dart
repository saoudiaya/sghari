import 'package:flutter/material.dart';

// Email Field
TextFormField reusableEmailTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (val) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(val!);
      if (val.isEmpty) {
        return "Required fields";
      } else if (!emailValid) {
        return "Enter Valid Email";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.emailAddress,
  );
}

//Password Field
TextFormField reusablePasswordTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    validator: (val) {
      if (val!.isEmpty) {
        return "Required fields";
      } else if (controller.text.length < 8) {
        return "Password Length Should be more than 8 characters";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

//Name Field

TextFormField reusableNameTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (val) {
      if (val!.isEmpty) {
        return "Required fields";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.name,
  );
}

TextFormField reusableAddressTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (val) {
      if (val!.isEmpty) {
        return "Required fields";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.streetAddress,
  );
}

//PhoneNumber
TextFormField reusablePhoneTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (val) {
      if (val!.isEmpty) {
        return "Required fields";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.phone,
  );
}

TextFormField reusablebirthadyTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (val) {
      if (val!.isEmpty) {
        return "Required fields";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.text,
  );
}

TextFormField reusablegenderTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  String gender = 'Male'; // default value

  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (val) {
      if (val!.isEmpty) {
        return "Required fields";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      suffix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: const Text('Male'),
            value: 'Male',
            groupValue: gender,
            onChanged: (value) {
              gender = value.toString();
            },
          ),
          RadioListTile(
            title: const Text('Female'),
            value: 'Female',
            groupValue: gender,
            onChanged: (value) {
              gender = value.toString();
            },
          ),
        ],
      ),
    ),
    keyboardType: TextInputType.text,
  );
}
TextFormField reusablesicknessTextField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (val) {
      if (val!.isEmpty) {
        return "Required fields";
      }
      return null;
    },
    style: TextStyle(
        color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.w300),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.07),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.text,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.blueGrey[200];
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}
