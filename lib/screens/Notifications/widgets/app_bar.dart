import 'dart:core';

import 'package:flutter/material.dart';

class AppBarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarWithBackButton({this.title});
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
                  Navigator.of(context).pushReplacementNamed('/Home'),
              icon: Icon(Icons.arrow_forward)),
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
