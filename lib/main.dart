import 'package:flutter/material.dart';
import 'package:dean/screens/Home/home_screen.dart';
import 'package:dean/screens/InformationAboutTheGesture/information_screen.dart';
import 'package:dean/screens/Splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => HomeScreen(title: 'DEAN'),
    '/Information': (BuildContext context) =>
        InformationAboutTheGestureScreen(title: 'DEAN')
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEAN',
      home: SplashScreen(nextRoute: '/Home'),
      routes: routes,
    );
  }
}
