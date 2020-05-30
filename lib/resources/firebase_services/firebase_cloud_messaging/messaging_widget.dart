import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobilerecharge/models/entity_model/firebase_message_model.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<FirebaseMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> _message) async {
        print("onMessage: $_message");
        final notification = _message['notification'];
        setState(() {
          _messages.add(
              FirebaseMessage(title: notification['title'], body: notification['body']));
        });
      },
      onLaunch: (Map<String, dynamic> _message) async {
        print("onLaunch: $_message");

        final notification = _message['data'];
        setState(() {
          _messages.add(FirebaseMessage(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      onResume: (Map<String, dynamic> _message) async {
        print("onResume: $_message");
        final notification = _message['data'];

        setState(() {
          _messages.add(FirebaseMessage(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: _messages.map(buildMessage).toList(),
        ),
      ),
    );
  }

  Widget buildMessage(FirebaseMessage _message) => ListTile(
        title: Text(_message.title),
        subtitle: Text(_message.body),
      );
}
