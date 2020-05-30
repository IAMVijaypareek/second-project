import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilerecharge/screens/chat_screens/userscreens/consult_doctor_tabs.dart';

class DoctorProfile extends StatefulWidget {
  final String tag;
  final String docUrl;

  final String docName;
  final String docExpert;
  final String docQualification;
  final String docCity;
  final String docExp;
  final String docuid;
  final String userUid;
  DoctorProfile(
      {this.tag,
      this.docUrl,
      this.docName,
      this.docExpert,
      this.docQualification,
      this.docCity,
      this.docExp,
      this.docuid,
      this.userUid});
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  addingContact() async {
    QuerySnapshot usersnapshot = await Firestore.instance
        .collection("contactlist")
        .document(widget.userUid)
        .collection("contacts")
        .where("sender", isEqualTo: widget.docuid)
        .getDocuments();
    QuerySnapshot docsnapshot = await Firestore.instance
        .collection("contactlist")
        .document(widget.docuid)
        .collection("contacts")
        .where("sender", isEqualTo: widget.userUid)
        .getDocuments();

    if (usersnapshot.documents.isEmpty) {
      Firestore.instance
          .collection("contactlist")
          .document(widget.userUid)
          .collection("contacts")
          .add({
        'sender': widget.docuid,
        'user uid': widget.userUid,
        'timestamp': Timestamp.now(),
        'Doc name': widget.docName,
        'Doc img': widget.docUrl,
        'Doc expert': widget.docExpert
      });
    }
    if (docsnapshot.documents.isEmpty) {
      Firestore.instance
          .collection("contactlist")
          .document(widget.docuid)
          .collection("contacts")
          .add({
        'Dr uid': widget.docuid,
        'sender': widget.userUid,
        'timestamp': Timestamp.now(),
      });
    }

/*
Firestore.instance.collection("contactlist").document(widget.userUid).
collection(widget.docuid).document(widget.docuid).setData({
'Dr uid' : widget.docuid,
 'user uid' : widget.userUid,
 'timestamp' : Timestamp.now()
  

});*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addingContact();

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ConsultDoctor(
                      druid: widget.docuid,
                    )));
          },
          child: Icon(Icons.contact_mail)),
      body: Center(
        child: Container(
            child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Flexible(
              child: Hero(
                  tag: widget.tag,
                  child: Image(
                    image: NetworkImage(widget.docUrl),
                    fit: BoxFit.cover,
                  )),
            ),
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  Text(
                    widget.docName,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    widget.docExpert,
                    style: GoogleFonts.aclonica(
                        textStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    widget.docCity,
                    style: GoogleFonts.aclonica(
                        textStyle: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    widget.docExp + "years of Experience",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    widget.docExpert,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "License",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "Thought:Humanity is above all",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold)),
                  )
                ]),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
