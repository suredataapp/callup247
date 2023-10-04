import 'package:flutter/material.dart';

import 'src/01_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CallUp247',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
