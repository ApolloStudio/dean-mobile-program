import 'dart:core';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

// Наследуемся от виджета с состоянием,
// то есть виджет для изменения состояния которого не требуется пересоздавать его инстанс
class SplashScreen extends StatefulWidget {
  // переменная для хранения маршрута
  final String nextRoute;

  // конструктор, тело конструктора перенесено в область аргументов,
  // то есть сразу аргументы передаются в тело коструктора и устанавливаются внутренним переменным
  // Dart позволяет такое
  SplashScreen({required this.nextRoute});

  // все подобные виджеты должны создавать своё состояние,
  // нужно переопределять данный метод
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

// Создаём состояние виджета
class _SplashScreenState extends State<SplashScreen> {
  // Инициализация состояния
  @override
  void initState() {
    super.initState();
    // Создаём таймер, который должен будет переключить SplashScreen на HomeScreen через 2 секунды
    Timer(Duration(seconds: 2),
        // Для этого используется статический метод навигатора
        // Это очень похоже на передачу лямбда функции в качестве аргумента std::function в C++
        () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  // Формирование виджета
  @override
  Widget build(BuildContext context) {
    // А вот это вёрстка виджета,
    // немного похоже на QML хотя явно не JSON структура
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: ParticleBackgroundApp()));
  }
}

class ParticleBackgroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned.fill(child: AnimatedBackground()),
      Positioned.fill(child: CenteredText()),
    ]);
  }
}

enum _ColorTween { color1, color2 }

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_ColorTween>()
      ..add(
        _ColorTween.color1,
        Color(0xff8a113a).tweenTo(Colors.lightBlue.shade900),
        3.seconds,
      )
      ..add(
        _ColorTween.color2,
        Color(0xff440216).tweenTo(Colors.blue.shade600),
        3.seconds,
      );

    return MirrorAnimation<MultiTweenValues<_ColorTween>>(
      tween: tween,
      duration: tween.duration,
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                value.get<Color>(_ColorTween.color1),
                value.get<Color>(_ColorTween.color2)
              ])),
        );
      },
    );
  }
}

class CenteredText extends StatelessWidget {
  const CenteredText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircularProgressIndicator(
        strokeWidth: 3.0,
      ),
      Text(
        "Loading...",
        style: TextStyle(color: Colors.white),
        textScaleFactor: 2,
      )
    ]));
  }
}
