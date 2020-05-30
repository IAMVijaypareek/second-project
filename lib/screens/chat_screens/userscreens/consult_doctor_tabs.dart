import 'package:flutter/material.dart';
import 'package:mobilerecharge/screens/chat_screens/userscreens/user_chat_screen.dart';

class ConsultDoctor extends StatefulWidget {
  final String druid;
  ConsultDoctor({this.druid});

  @override
  _ConsultDoctorState createState() => _ConsultDoctorState();
}

class _ConsultDoctorState extends State<ConsultDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.dialer_sip)),
                Tab(icon: Icon(Icons.video_call)),
              ],
            ),
            title: Text('Dr. Vijay pareek'),
          ),
          body: TabBarView(
            children: [
              ChatScreen(receiver: widget.druid),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
