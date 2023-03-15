import 'package:ai_rdio/screen/RegLoginUi.dart';
import 'package:ai_rdio/screen/Regis.dart';
import 'package:ai_rdio/screen/home_page2.dart';
import 'package:ai_rdio/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => splash(),
        'home': (context) => Home_page(),
        'login': (context) => RegLoginUi(),
        'Signup': (context) => regis(),
      },
    );
  }
}
