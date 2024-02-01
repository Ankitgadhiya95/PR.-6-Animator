import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planets.dart';
import '../planet_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.planet});

  final PlanetsModel planet;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor:
          darkTheme.isDarkMethod == true ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                                color: darkTheme.isDarkMethod == true
                                    ? Color(0xFF022638).withOpacity(0.8)
                                    : Color(0xFFE7A611FF).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: darkTheme.isDarkMethod == true
                                  ? Color(0xFF0090CE)
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              color: darkTheme.isDarkMethod == true
                                  ? Color(0xFF022638).withOpacity(0.8)
                                  : Color(0xFFE7A611FF).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            Icons.more_vert_rounded,
                            color: darkTheme.isDarkMethod == true
                                ? Color(0xFF0090CE)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/images/${planet.thumbnail!}",
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  SizedBox(height: 24),
                  Text(
                    planet.name!,
                    style: TextStyle(
                        fontFamily: 'Proportional',
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: darkTheme.isDarkMethod == true
                            ? Colors.white
                            : Colors.black),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Size',
                                style: TextStyle(
                                    fontFamily: 'Proportional',
                                    fontWeight: FontWeight.w500,
                                    color: darkTheme.isDarkMethod == true
                                        ? Color(0xFF0090CE)
                                        : Colors.black,
                                    fontSize: 18),
                              ),
                              SizedBox(height: 24),
                              Text(
                                'D = ${planet.size} Km',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 1.2,
                                    color: darkTheme.isDarkMethod == true
                                        ? Colors.white
                                        : Color(0xFFE7A611FF),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Distance from Sun',
                                style: TextStyle(
                                    fontFamily: 'Proportional',
                                    fontWeight: FontWeight.w500,
                                    color: darkTheme.isDarkMethod == true
                                        ? Color(0xFF0090CE)
                                        : Colors.black,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '${planet.distanceFromSun} Km',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 1.2,
                                    color: darkTheme.isDarkMethod == true
                                        ? Colors.white
                                        : Color(0xFFE7A611FF),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '${planet.description} ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          letterSpacing: 1.2,
                          color: darkTheme.isDarkMethod == true
                              ? Colors.white
                              : Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
