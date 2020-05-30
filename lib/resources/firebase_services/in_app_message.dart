import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/material.dart';

class ProgrammaticTriggersExample extends StatelessWidget {
  const ProgrammaticTriggersExample(this.fiam);

  final FirebaseInAppMessaging fiam;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            const Text(
              "Programmatic Trigger",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text("Manually trigger events programmatically "),
            const SizedBox(height: 8),
            RaisedButton(
              onPressed: () {
                fiam.triggerEvent('chicken_event');
                Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Triggering event: chicken_event")));
              },
              color: Colors.blue,
              child: Text(
                "Programmatic Triggers".toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
