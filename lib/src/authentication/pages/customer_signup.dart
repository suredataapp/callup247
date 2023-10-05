import 'package:callup247/src/responsive_text_styles.dart';
import 'package:flutter/material.dart';

class CustomerSignUpScreen extends StatefulWidget {
  const CustomerSignUpScreen({super.key});

  @override
  State<CustomerSignUpScreen> createState() => _CustomerSignUpScreenState();
}

class _CustomerSignUpScreenState extends State<CustomerSignUpScreen> {
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
                      // You can add more phone number validation logic here.
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
                      // You can add email validation logic here.
                      return null;
                    },
                  ),
                  // country
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Country'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'State'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'City'),
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    style: responsiveTextStyle(context, 16, Colors.white, null),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: responsiveTextStyle(
                            context, 14, Colors.black87, null),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87))),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      // You can add password strength validation logic here.
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your sign-up logic here.
                    },
                    child: const Text('Sign Up'),
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
