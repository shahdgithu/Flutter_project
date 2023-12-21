import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    primarySwatch: Colors.green,
    textTheme: GoogleFonts.montserratTextTheme()
        .copyWith(caption: TextStyle(color: Colors.black)),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.green,
        ),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18)));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    primarySwatch: Colors.green,
    textTheme: GoogleFonts.montserratTextTheme()
        .copyWith(caption: TextStyle(color: Colors.white)),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.green),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18)));
