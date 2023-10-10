import 'package:callup247/src/responsive_text_styles.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CustomerSignUpScreen extends StatefulWidget {
  const CustomerSignUpScreen({super.key});

  @override
  State<CustomerSignUpScreen> createState() => _CustomerSignUpScreenState();
}

class _CustomerSignUpScreenState extends State<CustomerSignUpScreen> {
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  bool isPasswordVisible = false;
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF13CAF1),
        title: Text(
          'Sign Up',
          style:
              responsiveTextStyle(context, 20, Colors.black, FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF039fdc),
                Color(0xFF13CAF1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              child: Column(
                children: [
                  // full name
                  TextFormField(
                    cursorColor: Colors.white,
                    textCapitalization: TextCapitalization.words,
                    style: responsiveTextStyle(context, 16, Colors.white, null),
                    decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: responsiveTextStyle(
                            context, 14, Colors.black87, null),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  // Phone Number
                  TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.phone,
                    style: responsiveTextStyle(context, 16, Colors.white, null),
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: responsiveTextStyle(
                            context, 14, Colors.black87, null),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // Phone number regex pattern (allowing only digits, optional '+' at the beginning)
                      const phonePattern = r'^\+?[0-9]+$';
                      final regExp = RegExp(phonePattern);

                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      // You can add more specific validation logic here if needed.
                      return null;
                    },
                  ),
                  // email address
                  TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    style: responsiveTextStyle(context, 16, Colors.white, null),
                    decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: responsiveTextStyle(
                            context, 14, Colors.black87, null),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      }
                      // Email address regex pattern for basic validation
                      const emailPattern =
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                      final regExp = RegExp(emailPattern);

                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      // You can add email validation logic here.
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  // Country Picker
                  CSCPicker(
                    dropdownDecoration: BoxDecoration(
                        color: const Color(0xFF13CAF1),
                        borderRadius: BorderRadius.circular(6)),
                    disabledDropdownDecoration: BoxDecoration(
                        color: const Color(0xFF039fdc),
                        borderRadius: BorderRadius.circular(6)),
                    selectedItemStyle:
                        responsiveTextStyle(context, 14, Colors.black, null),
                    onCountryChanged: (value) {
                      // Handle the selected country value here.
                      setState(() {
                        // Store the selected country value in a variable.
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      // Handle the selected state value here.
                      setState(() {
                        // Store the selected state value in a variable.
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      // Handle the selected city value here.
                      setState(() {
                        // Store the selected city value in a variable.
                        cityValue = value;
                      });
                    },
                  ),
                  // home address
                  TextFormField(
                    cursorColor: Colors.white,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.streetAddress,
                    style: responsiveTextStyle(context, 16, Colors.white, null),
                    decoration: InputDecoration(
                        labelText: 'Home Address',
                        labelStyle: responsiveTextStyle(
                            context, 14, Colors.black87, null),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your home address';
                      }
                      return null; // Return null to indicate a valid input.
                    },
                  ),
                  // Password
                  TextFormField(
                    cursorColor: Colors.white,
                    style: responsiveTextStyle(context, 16, Colors.white, null),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          responsiveTextStyle(context, 14, Colors.black, null),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    obscureText: !isPasswordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      // Password strength validation criteria
                      const lengthCriteria = 8; // Minimum length requirement
                      final uppercaseCriteria = RegExp(r'[A-Z]');
                      final lowercaseCriteria = RegExp(r'[a-z]');
                      final digitCriteria = RegExp(r'[0-9]');
                      final specialCharCriteria =
                          RegExp(r'[!@#$%^&*(),.?":{}|<>]');

                      if (value.length < lengthCriteria) {
                        return 'Password must be at least $lengthCriteria characters long';
                      }

                      if (!uppercaseCriteria.hasMatch(value) ||
                          !lowercaseCriteria.hasMatch(value) ||
                          !digitCriteria.hasMatch(value) ||
                          !specialCharCriteria.hasMatch(value)) {
                        return 'Password must include uppercase, lowercase, digit, and special characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  // display picture
                  GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: Column(
                      children: <Widget>[
                        if (_image != null)
                          Image.file(
                            _image!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        else
                          const Icon(
                            Icons.camera_alt,
                            size: 100,
                            color: Colors.black54,
                          ),
                        Text(
                          'Add a display pictue :)',
                          style: responsiveTextStyle(
                              context, 14, Colors.black, null),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF039fdc)),
                    onPressed: () {
                      // Add your sign-up logic here.
                    },
                    child: Text(
                      'Sign Up',
                      style: responsiveTextStyle(
                          context, 14, Colors.black, FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
