import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilerecharge/models/entity_model/doctor_model.dart';
import 'package:mobilerecharge/screens/chat_screens/userscreens/doctor_profile.dart';

class ListOfDoctors extends StatefulWidget {
  @override
  _ListOfDoctorsState createState() => _ListOfDoctorsState();
}

class _ListOfDoctorsState extends State<ListOfDoctors> {
  List herotag = ['img1', 'img2', 'img3', 'img4'];
  List<Doctor> doctors = [
    Doctor(
        name: "vijay",
        img: "images/download.jpg",
        qualification: "MBBS",
        experience: 10,
        expert: "physcian",
        city: "Mumbai"),
    Doctor(
        name: "vijay pareek",
        img: "images/doctor.png",
        qualification: "MBBS",
        experience: 10,
        expert: "physcian",
        city: "Mumbai"),
    Doctor(
        name: "Ajay",
        img: "images/family.png",
        qualification: "MBBS",
        experience: 10,
        expert: "physcian",
        city: "Mumbai"),
    Doctor(
        name: "vijay",
        img: "images/smiley.png",
        qualification: "MBBS",
        experience: 10,
        expert: "physcian",
        city: "Mumbai")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey,
        appBar: AppBar(
          iconTheme: IconThemeData(),
          flexibleSpace: Container(color: Colors.white),
          title: Text(
            "Choose your Doctorji..",
            style:
                GoogleFonts.patuaOne(textStyle: TextStyle(color: Colors.blue)),
          ),
        ),
        body: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (contex, index) {
              return GestureDetector(
                child: Card(
                    elevation: 1.0,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
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
                                      image: AssetImage(doctors[index].img),
                                    ))),
                          ),
                          Positioned(
                              top: 20.0,
                              right: 20.0,
                              child: Text(
                                doctors[index].name,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 20.0),
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              top: 50.0,
                              right: 20.0,
                              child: Text(
                                doctors[index].expert,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 10.0),
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              top: 40.0,
                              right: 20.0,
                              child: Text(
                                doctors[index].qualification,
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
                                  Text(doctors[index].city)
                                ],
                              ))),
                          Positioned(
                              top: 80.0,
                              right: 50.0,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      doctors[index].experience.toString() +
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
                                                        docName:
                                                            doctors[index].name,
                                                        docCity:
                                                            doctors[index].city,
                                                        docExp: doctors[index]
                                                            .experience
                                                            .toString(),
                                                        docQualification:
                                                            doctors[index]
                                                                .qualification,
                                                        docExpert:
                                                            doctors[index]
                                                                .expert,
                                                      )));
                                        },
                                        child: Text(
                                          "Consult",
                                          style: GoogleFonts.lato(
                                              textStyle:
                                                  TextStyle(fontSize: 10.0),
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
            }));
  }
}
