import 'dart:core';

import 'package:flutter/material.dart';
import 'package:dean/screens/Home/widgets/video_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState(title);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState(this.title);

  int selectedIndex = 0;
  Widget _myNewsFeed = MyNewsFeed();
  Widget _myArticles = MyArticles();
  final String title;

  @override
  Widget build(BuildContext context) {
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
        body: this.getBody(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: "News feed",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: "Articles",
            )
          ],
          onTap: (int index) {
            this.onTapHandler(index);
          },
        ),
        floatingActionButton: ShowVideoConfirmDialogButton());
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._myNewsFeed;
    } else {
      return this._myArticles;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}

class MyNewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("News feed"));
  }
}

class MyArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Articles"));
  }
}
