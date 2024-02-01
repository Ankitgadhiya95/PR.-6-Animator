import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'models/planets.dart';

class ThemeProvider with ChangeNotifier {
  bool theme = false;



  Future loadJsonData() async {
    listPlanets.clear();

    var data = await rootBundle.loadString('assets/planetjson.json');
    print(data);
    var parseData = jsonDecode(data);

    var response = parseData;

    response.forEach((element) {
      listPlanets.add(PlanetsModel.fromJson(element));
      notifyListeners();
      // setState(() {
      //
      // });
    });
    print(parseData);
  }

  get getJsnModel {
    return listPlanets;
  }

  get isDarkMethod {
    return theme;
  }

  set setDarkTheme(bool value) {
    theme = value;
    notifyListeners();
  }
}
