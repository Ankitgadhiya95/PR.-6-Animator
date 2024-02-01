import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/planets.dart';
import '../planet_provider.dart';

class PlanetItem extends StatefulWidget {
  PlanetItem({
    super.key,
    required this.viewPortFraction,
    required this.scale,
    required this.planet,
  });

  final PlanetsModel planet;

  final double viewPortFraction;
  final double scale;

  @override
  State<PlanetItem> createState() => _PlanetItemState();
}

class _PlanetItemState extends State<PlanetItem> {
  //var jsonData;

  bool isLoading = false;

 // PlanetsModel? jm;

  // @override
  // void initState() {
  //   final darkTheme = Provider.of<ThemeProvider>(context, listen: false);
  //   setState(() {
  //     isLoading = true;
  //   });
  //   // TODO: implement initState
  //
  //   darkTheme.loadJsonData().then((value) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeProvider>(context, listen: true);
    return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.4 *
                      max(widget.viewPortFraction,
                          widget.scale - widget.viewPortFraction),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: darkTheme.isDarkMethod==true? Color(0xFF022638).withOpacity(0.8):Color(0xFFE7A611FF).withOpacity(0.8),//Color(0xFF022638),

                      // color: Color(0xFF022638).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25)),
                ),
                Positioned(
                  left: 80,
                  bottom: 8,
                  child: Image.asset(
                    'assets/images/${widget.planet.thumbnail}',
                    height: MediaQuery.of(context).size.height *
                        0.65 *
                        (widget.scale - widget.viewPortFraction),
                    width: MediaQuery.of(context).size.width *
                        0.65 *
                        (widget.scale - widget.viewPortFraction),
                  ),
                ),
                Positioned(
                  left: 36,
                  right: 36,
                  bottom: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.planet.name!,
                          style: TextStyle(
                              fontFamily: 'Proportional',
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w900,
                              color: darkTheme.isDarkMethod==true? Colors.white:Colors.black,
                              //color: Color(0XFFFFFFFF),
                              fontSize: 32)),
                       Icon(
                        Icons.arrow_forward_ios_outlined,
                           color: darkTheme.isDarkMethod==true?Color(0xFF0090CE):Colors.white
                      //  color: Color(0xFF0090CE),
                      )
                    ],
                  ),
                )
              ],

    );
  }
}
