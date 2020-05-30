import 'package:flutter/material.dart';
import 'package:mobilerecharge/screens/chat_screens/userscreens/user_chat_screen.dart';

class NotificationChatScreen extends StatefulWidget {
  final String receiver;

  NotificationChatScreen({this.receiver});
  @override
  _NotificationChatScreenState createState() => _NotificationChatScreenState();
}

class _NotificationChatScreenState extends State<NotificationChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: Container(
        child:ChatScreen(
          receiver:widget.receiver ,
        )
      ),
      
    );
  }
}