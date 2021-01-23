import 'package:flutter/material.dart';
import 'package:flutter_anim/OnBoarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
    );
  }
}

