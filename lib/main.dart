import 'package:animator/planet_provider.dart';
import 'package:animator/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/planets.dart';

List<PlanetsModel> listPlanets = [];

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});




  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  bool isDark = false;
  final ThemeData lighttheme = ThemeData(
    primaryColor: Color(0xFFE7A611),
    brightness: Brightness.dark,
    indicatorColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0XFFF5A623),
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
  final ThemeData darktheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.light,
    indicatorColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: Consumer<ThemeProvider>(builder: (context, providerios, child) {
        return MaterialApp(

          theme: providerios.isDarkMethod == false ? lighttheme : darktheme,

          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      }),
    );
  }
}
