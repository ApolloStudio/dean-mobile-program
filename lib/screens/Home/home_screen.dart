import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dean/services/notifications.dart';

// Такое же виджет, как и SplashScreen, только передаём ему ещё и заголовок
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState(title);
}

// Формирование состояния виджета
class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState(this.title);

  int selectedIndex = 0;
  Widget _myNewsFeed = MyNewsFeed();
  Widget _myArticles = MyArticles();
  final String title;
  final ImagePicker _picker = ImagePicker();
  final Notifications _notifications = Notifications();

  @override
  void initState() {
    super.initState();
    _notifications.initNotifications(); // инициализация
  }

  void _pushNotification(String title, String body) {
    _notifications.pushNotification(title, body); // вызов уведомления
  }

  void _onPressedButtonVideo() async {
    XFile? file = await _picker.pickVideo(
        source: ImageSource.camera, maxDuration: const Duration(seconds: 10));

    if (file != null) {
      if (file.path.indexOf('file://') == 0) {
        file = XFile(
          file.path.split('file://')[1],
        );
      }
      await GallerySaver.saveVideo(file.path, albumName: 'test');
      _pushNotification('debug', 'Test complited, video saved!');
      Navigator.of(context).pushReplacementNamed('/Home');
    }
  }

  void buildConfirmDialog(
      BuildContext context, String title, String subtitle, String textButton) {
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    minimumSize: MaterialStateProperty.all(
                                        Size(250, 50)),
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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                onPressed: () => buildConfirmDialog(
                    context,
                    "Do you want to switch to video capture mode?",
                    "The video will be sent to the neural network for processing in order to determine the tin on it.",
                    "Go over"),
                heroTag: 'video1',
                tooltip: 'Take a Video',
                child: Container(
                  height: 60,
                  width: 60,
                  child: const Icon(Icons.videocam),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // circular shape
                    gradient: LinearGradient(
                      colors: [
                        Colors.cyan,
                        Colors.blue,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
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
