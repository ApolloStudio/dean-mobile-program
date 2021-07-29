import 'dart:core';

import 'package:flutter/material.dart';

class AppBarWithNotificationsButton extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarWithNotificationsButton({this.title});
  Size get preferredSize => const Size.fromHeight(50);
  final String? title;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title!),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 2),
          child: IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/Notifications'),
              icon: Icon(Icons.notifications)),
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.cyan, Colors.blue])),
      ),
    );
  }
}
