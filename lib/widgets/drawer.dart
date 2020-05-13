import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilerecharge/widgets/auth_service.dart';
import 'package:mobilerecharge/widgets/messagehandler.dart';
import 'package:mobilerecharge/widgets/messaging_widget.dart';
import 'package:mobilerecharge/widgets/videoplayerdemo.dart';
import 'package:provider/provider.dart';




class DrawerTab extends StatefulWidget {
  @override
  _DrawerTabState createState() => _DrawerTabState();
}

class _DrawerTabState extends State<DrawerTab> {
  @override
  Widget build(BuildContext context) {
    print("drawer build");
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    if (user == null) return Text("loading...");
    return SafeArea(
      child: Drawer(
        elevation: 0.0,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 80.0,
              child: Container(
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.white60,
                        Colors.blue
                        
                      ]

                    )
                  ),
                  accountName: Text(""),
                  accountEmail: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Welcome "  + "\n" + user.phoneNumber.replaceFirst(RegExp(r'\+91'), ''),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      FlatButton(onPressed: () {}, child: Icon(Icons.edit))
                    ],
                  ),
                ),
              ),
            ),
          
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: Icon(Icons.phone_android, color: Colors.red),
                title: Text(
                  "Recharge",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "recharge your phone",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessageHandler()));
                },
              ),
            ),
            Divider(
              thickness: 3.0,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: Icon(Icons.card_giftcard, color: Colors.orange),
                title: Text(
                  "Offers",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "get exciting offers",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessagingWidget()));
                },
              ),
            ),
            Divider(
              thickness: 3.0,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.teal,
                ),
                title: Text(
                  "About Us",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Company info",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoApp()));
                },
              ),
            ),
            Divider(
              thickness: 3.0,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue,
                ),
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "need help?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                    
                },
              ),
            ),
            Divider(
              thickness: 3.0,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                trailing: Icon(Icons.exit_to_app, color: Colors.green),
                title: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "logout here",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  AuthService().signOut();
                  //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>LoginPage() ));
                },
              ),
            ),
            Divider(
              thickness: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
