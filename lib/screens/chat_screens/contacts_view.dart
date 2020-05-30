import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilerecharge/constants/strings.dart';
import 'package:mobilerecharge/screens/chat_screens/notification_chat_screen.dart';
import 'package:provider/provider.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user1 = Provider.of<FirebaseUser>(context);

    if (user1 == null) {
      return Text("loading...data");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact View"),
      ),
      body: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: user1.uid == null
                  ? Text("loading...")
                  : StreamBuilder(
                      stream: Firestore.instance
                          .collection("contactlist")
                          .document(user1.uid)
                          .collection("contacts")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const Text('Loading...');
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot document =
                                  snapshot.data.documents[index];
                              if (document == null) {
                                //print(document);
                                return Center(child: Text("noo"));
                              }
                              return Center(
                                child: Card(
                                    child: Container(
                                  // color: Colors.black,
                                  height: 100.0,
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NotificationChatScreen(
                                                    receiver: document.data['sender']
                                                  )));
                                    },
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        document.data['Doc img'] ??
                                            noImageAvailable,
                                      ),
                                      radius: 35.0,
                                    ),
                                    title: Text(
                                      document.data['Doc name'] ?? "patient",
                                    ),
                                    subtitle: Text(
                                        document.data['Doc expert'] ??
                                            "need help"),
                                  ),
                                )),
                              );
                            });
                      }))),
    );
  }
}
