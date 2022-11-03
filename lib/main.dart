import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/pages/page_container.dart';
import 'package:flutter_weather_app/styles.dart';
import 'package:flutter_weather_app/themes.dart';

import 'models/app_settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppSettings settings = AppSettings();

  // Don't allow landscape mode
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp(settings: settings,)));
}

class MyApp extends StatelessWidget {
  final AppSettings settings;
  const MyApp({super.key, required this.settings});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: "Cabin",
      primaryColor: AppColor.midnightSky,
      accentColor: AppColor.midnightCloud,
      primaryTextTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColor.textColorDark,
        displayColor: AppColor.textColorDark,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColor.textColorDark,
        displayColor: AppColor.textColorDark,
      ),
    );

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: PageContainer(settings: settings),
    );
  }
}
