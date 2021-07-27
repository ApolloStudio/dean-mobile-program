import 'package:flutter/material.dart';
import 'package:dean/screens/Home/home_screen.dart';
import 'package:dean/screens/Splash/splash_screen.dart';

// Запуск приложения
void main() => runApp(MyApp());

// Основной виджет приложения
class MyApp extends StatelessWidget {
  // Формируем маршрутизацию приложения
  final routes = <String, WidgetBuilder>{
    // Путь, по которому создаётся Home Screen
    '/Home': (BuildContext context) => HomeScreen(title: 'DEAN')
  };

  // Необходимо переопределить метод строительства инстанса виджета
  @override
  Widget build(BuildContext context) {
    // Это будет приложение с поддержкой Material Design
    return MaterialApp(
      title: 'DEAN',
      // в котором будет Splash Screen с указанием следующего маршрута
      home: SplashScreen(nextRoute: '/Home'),
      // передаём маршруты в приложение
      routes: routes,
    );
  }
}
