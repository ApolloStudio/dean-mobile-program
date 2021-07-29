import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dean/screens/InformationAboutTheGesture/widgets/radiant_gradiant_mask.dart';
import 'package:dean/screens/InformationAboutTheGesture/widgets/app_bar.dart';

class InformationAboutTheGestureScreen extends StatefulWidget {
  InformationAboutTheGestureScreen({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  _InformationAboutTheGestureScreenState createState() =>
      _InformationAboutTheGestureScreenState(title);
}

class _InformationAboutTheGestureScreenState
    extends State<InformationAboutTheGestureScreen> {
  _InformationAboutTheGestureScreenState(String title);

  bool _isFavorited = true;

  void _onPressedIconButton() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSelection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Test name article',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Text(
                'Test...',
                style: TextStyle(color: Colors.grey[500], fontSize: 18),
              )
            ],
          )),
          IconButton(
              onPressed: _onPressedIconButton,
              icon: RadiantGradientMask(
                child: (_isFavorited
                    ? Icon(Icons.favorite_border)
                    : Icon(Icons.favorite)),
              ),
              color: Colors.cyan[500])
        ],
      ),
    );

    Widget textSelection = Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Text....',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBarWithBackButton(title: widget.title),
      drawer: Drawer(),
      body: ListView(
        children: [
          Image.asset(
            "assets/images/test.png",
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSelection,
          textSelection
        ],
      ),
    );
  }
}
