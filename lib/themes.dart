import 'package:flutter/material.dart';
import 'package:flutter_weather_app/styles.dart';

enum AppThemes { light, dark, system }

//Themes definitions
ThemeData get lightTheme => ThemeData(
  // Define the default brightness and colors for the overall app.
  brightness: Brightness.light,
  primaryColor: AppColor.midnightSky,
  accentColor: AppColor.midnightCloud,
  fontFamily: 'Cabin',
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
);

ThemeData get darkTheme => ThemeData(
  // Define the default brightness and colors for the overall app.
  brightness: Brightness.dark,
  primaryColor: Colors.orange,
  fontFamily: 'Pangolin',
  accentColor: Colors.yellowAccent,
);