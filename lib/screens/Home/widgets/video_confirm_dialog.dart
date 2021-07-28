import 'dart:core';

import 'package:flutter/material.dart';

void buildConfirmDialog(BuildContext context, String title, String subtitle,
    String textButton, dynamic _onPressedButtonVideo) {
  showDialog(
      context: context,
      builder: (context) {
        return Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                        child: Text(title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                        child: Text(subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.cyan,
                                    Colors.blue,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(250, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  // elevation: MaterialStateProperty.all(3),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () => _onPressedButtonVideo(),
                                child: Text(textButton,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0))))),
                  ),
                ],
              ),
            ));
      });
}
