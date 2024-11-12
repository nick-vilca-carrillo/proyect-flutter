import 'package:flutter/material.dart';
import 'package:proyecto1/Views/MainView.dart';

import '../Views/HomeView.dart';

class MyApp extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    HomeView home=HomeView();
    MainView mainView=MainView();
    Map<String,Widget Function(BuildContext)> rutas = {
      'homeview':(context)=> home,
      'mainview':(context)=> mainView
    };

    MaterialApp app=MaterialApp(
      title: "Mi Primera App",
      routes: rutas,
      initialRoute: "homeview",
    );

    return app;
  }


}