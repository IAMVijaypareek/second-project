import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilerecharge/constants/strings.dart';
import 'package:mobilerecharge/models/entity_model/doctor_model.dart';
import 'package:mobilerecharge/screens/chat_screens/userscreens/doctor_profile.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //final AuthMethods _authMethods = AuthMethods();

  List<Doctor> userList;

  TextEditingController searchController = TextEditingController();
  List herotag = ['img1', 'img2', 'img3', 'img4'];
  String _curentUser;

  @override
  void initState() {
    super.initState  ();
    FirebaseAuth.instance.currentUser().then((user) => _curentUser = user.uid);

     fetchAllUsers().then((list) {
      setState(() {
        userList = list;
        print(userList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
                child: Container(
                    child: userList != null
                        ? StreamBuilder(
                            stream: fetchAllUsers().asStream(),
                            builder: (cotext, snapshot) {
                              if (snapshot.data == null) {
                                return Text("loading.");
                              }
                              return listbuilder();
                            })
                        : CircularProgressIndicator()))));
  }

  Future<List<Doctor>> fetchAllUsers() async {
    List<Doctor> userList = List<Doctor>();

    QuerySnapshot querySnapshot =
        await Firestore.instance.collection(USERS_COLLECTION).getDocuments();
    for (var i = 0; i < querySnapshot.documents.length; i++) {
      userList.add(Doctor.fromMap(querySnapshot.documents[i].data));
      print(querySnapshot.documents.length);
    }
    return userList;
  }

  Widget listbuilder() {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (contex, index) {
          return GestureDetector(
            child: Card(
                elevation: 1.0,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  height: MediaQuery.of(context).size.height / 3,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 10.0,
                        left: 10.0,
                        child: Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Hero(
                                tag: herotag[index],
                                child: Image(
                                  image: NetworkImage(
                                      userList[index].img ?? noImageAvailable),
                                ))),
                      ),
                      Positioned(
                          top: 20.0,
                          right: 20.0,
                          child: Text(
                            userList[index].name,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 20.0),
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          top: 50.0,
                          right: 20.0,
                          child: Text(
                            userList[index].expert,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 10.0),
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          top: 40.0,
                          right: 20.0,
                          child: Text(
                            userList[index].qualification,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 10.0),
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          top: 60.0,
                          right: 50.0,
                          child: Container(
                              // height: MediaQuery.of(context).size.height / 4,
                              child: Row(
                            children: <Widget>[
                              Icon(Icons.home),
                              Text(userList[index].city)
                            ],
                          ))),
                      Positioned(
                          top: 80.0,
                          right: 50.0,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  userList[index].experience.toString() +
                                      " years Experience",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(fontSize: 10.0),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (contex) =>
                                                  DoctorProfile(
                                                    tag: herotag[index],
                                                    docUrl: userList[index].img,
                                                    docName:
                                                        userList[index].name,
                                                    docCity:
                                                        userList[index].city,
                                                    docExp: userList[index]
                                                        .experience
                                                        .toString(),
                                                    docQualification:
                                                        userList[index]
                                                            .qualification,
                                                    docExpert:
                                                        userList[index].expert,
                                                    docuid: userList[index].uid,
                                                    userUid: _curentUser,
                                                  )));
                                    },
                                    child: Text(
                                      "Consult",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(fontSize: 10.0),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )),
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
          );
        });
  }
}
