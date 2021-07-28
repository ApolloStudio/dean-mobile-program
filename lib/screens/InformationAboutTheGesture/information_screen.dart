import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  bool _isFavorited = false;

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
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Test...',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          IconButton(
              onPressed: _onPressedIconButton,
              icon: (_isFavorited
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
              color: Colors.cyan[500])
        ],
      ),
    );

    Widget textSelection = Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Text....',
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.cyan, Colors.blue])),
        ),
      ),
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
