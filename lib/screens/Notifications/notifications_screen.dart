import 'dart:core';

import 'package:flutter/material.dart';
import 'package:dean/screens/Notifications/widgets/app_bar.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState(title);
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  _NotificationsScreenState(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBackButton(title: widget.title),
      drawer: Drawer(),
      body: Center(child: Text('Hello, world!')),
    );
  }
}
