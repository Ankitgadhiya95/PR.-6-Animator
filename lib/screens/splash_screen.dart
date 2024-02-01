import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/planets.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // for (var element in planetsData["planets"]) {
    //   listPlanets.add(PlanetsModel.fromJson(element));
    // }

    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    // TODO: implement initState

    super.initState();
    changeAnimation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool? animate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(
                milliseconds: 2500,
              ),
              curve: Curves.easeInOut,
              top: animate! ? -150 : -150,
              left: animate! ? -650 : -800,
              bottom: animate! ? -150 : -150,
              right: animate! ? 0 : 0,
              child: Image.asset("assets/images/earth_home.jpg"),
            ),
            Positioned(
              left: 25,
              bottom: 20,
              right: 25,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontFamily: 'Proportional',
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w900,
                      fontSize: 35),
                  children: [
                    TextSpan(text: 'discover your '),
                    TextSpan(
                        text: 'home',
                        style: TextStyle(
                            fontFamily: 'Proportional',
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future changeAnimation() async {
    animate = false;
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) {
      setState(() {
        animate = true;
      });
    }
  }
}
