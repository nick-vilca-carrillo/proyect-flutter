import 'package:flutter/material.dart';
import 'package:proyecto1/Views/LoginView.dart';
import 'package:proyecto1/Views/MainView.dart';
import 'package:proyecto1/Views/RegisterView.dart';
import 'package:proyecto1/Views/SplashView.dart';

import '../Views/HomeView.dart';

class MyApp extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    HomeView home=HomeView();
    MainView mainView=MainView();
    Map<String,Widget Function(BuildContext)> rutas = {
      '/splashview':(context)=> SplashView(),
      '/homeview':(context)=> home,
      '/mainview':(context)=> mainView,
      '/loginview':(context)=> LoginView(),
      '/registerview':(context)=> RegisterView(),


    };

    MaterialApp app=MaterialApp(
      title: "Mi Primera App",
      routes: rutas,
      initialRoute: "/splashview",
    );

    return app;
  }


}