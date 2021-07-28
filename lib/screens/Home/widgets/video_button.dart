import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dean/screens/Home/widgets/video_confirm_dialog.dart';
import 'package:dean/services/notifications.dart';

class ShowVideoConfirmDialogButton extends StatefulWidget {
  ShowVideoConfirmDialogButton({Key? key}) : super(key: key);

  @override
  _ShowVideoConfirmDialogButtonState createState() =>
      _ShowVideoConfirmDialogButtonState();
}

class _ShowVideoConfirmDialogButtonState
    extends State<ShowVideoConfirmDialogButton> {
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
      Navigator.of(context).pushReplacementNamed('/Information');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: FloatingActionButton(
            onPressed: () => buildConfirmDialog(
                context,
                "Do you want to switch to video capture mode?",
                "The video will be sent to the neural network"
                    " for processing in order to determine the tin on it.",
                "Go over",
                _onPressedButtonVideo),
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
    );
  }
}
