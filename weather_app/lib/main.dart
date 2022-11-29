import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_page.dart';

final pageKey = GlobalKey<WeatherPageState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Stations',
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: WeatherPage(
        title: 'Weather Stations',
        key: pageKey,
      ),
    );
  }
}
