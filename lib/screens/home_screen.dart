import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planets.dart';
import '../planet_provider.dart';
import '../planets/planet_item.dart';
import '../main.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? pageController;
  double? pageOffset = 1;
  double viewPortFraction = 0.85;
  var jsonData;

  bool isLoading = false;

  PlanetsModel? jm;

  @override
  void initState() {
    final darkTheme = Provider.of<ThemeProvider>(context, listen: false);
    setState(() {
      isLoading = true;
    });

    darkTheme.loadJsonData().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
    pageController =
        PageController(initialPage: 1, viewportFraction: viewPortFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController!.page;
            });
          });
  }

  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
  }

  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
     backgroundColor:darkTheme.isDarkMethod==true? Colors.black:Colors.white,
      body: Center(
        child: (isLoading == true)
            ? CircularProgressIndicator()
            : SafeArea(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome!",
                                style: TextStyle(
                                    fontFamily: 'Proportional',
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w900,
                                    color: darkTheme.isDarkMethod==true? Colors.white:Colors.black,
            fontSize: 32),
                              ),
                              (darkTheme.isDarkMethod == false)
                                  ? IconButton(
                                      onPressed: () {
                                        darkTheme.setDarkTheme = true;
                                      },
                                      icon: Icon(CupertinoIcons.moon,color: Color(0xFFE7A611FF),))
                                  : IconButton(
                                      onPressed: () {
                                        darkTheme.setDarkTheme = false;
                                      },
                                      icon: Icon(CupertinoIcons.sun_max_fill,color: Colors.white,))
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: PageView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: listPlanets.length,
                            controller: pageController,
                            itemBuilder: (context, index) {
                              double scale = max(
                                  viewPortFraction,
                                  (1 -
                                      (pageOffset! - index).abs() +
                                      viewPortFraction));
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      planet: listPlanets[index],
                                    ),
                                  ));
                                },
                                child: PlanetItem(
                                  viewPortFraction: viewPortFraction,
                                  scale: scale,
                                  planet: listPlanets[index],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('astronomical news',
                                  style: TextStyle(
                                      fontFamily: 'Proportional',
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: darkTheme.isDarkMethod==true? Colors.white:Colors.black)),
                              Text('see all',
                                  style: TextStyle(
                                      fontFamily: 'Proportional',
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: darkTheme.isDarkMethod==true? Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.7))),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 22),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16),
                          decoration: BoxDecoration(
                            color: darkTheme.isDarkMethod==true? Color(0xFF022638):Color(0xFFE7A611FF),//Color(0xFF022638),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'How humans pick\nout constellation',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 1.2,
                                        color: darkTheme.isDarkMethod==true? Color(0xFF0090CE):Colors.black,//Colors.white,
                                        fontSize: 16,
                                        height: 1.5),
                                  ),
                                   Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: darkTheme.isDarkMethod==true? Color(0xFF0090CE):Colors.white,
                                  )
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                " Around the world, people have long gazed up at the stars and found meaning in them. The Renaissance polymath Nicolaus Copernicus once wrote, “Of all things visible, the highest is the heaven of the fixed stars.” Five centuries later, Kalpana Chawla, the first Indian woman in space, said, “When you look at the stars and the galaxy, you feel that you are not just from one particular piece of land, but from the solar system.",
                                maxLines: 4,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 1.2,
                                  fontSize: 11,
                                  color: darkTheme.isDarkMethod==true? Colors.white:Colors.white,
                                  height: 1.5,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
