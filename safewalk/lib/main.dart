import 'package:flutter/material.dart';
import 'package:tempsafewalk/pages/home_page/home_page.dart';
import 'package:tempsafewalk/pages/welcome_page.dart';
import 'package:tempsafewalk/styles/global_themes.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      themeMode: ThemeMode.system,
    );
  }
}
