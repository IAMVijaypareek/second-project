import 'package:flutter/material.dart';

class CardDetail{
final String titletext;
final String imgurl;
final List<Color>  cardcoloring;

CardDetail({this.titletext,this.imgurl,this.cardcoloring});

}

final List<CardDetail>  card1 = [
CardDetail(
  titletext: "Stay Home",
  imgurl: "images/family.png",
  cardcoloring: [ Colors.blue,Colors.blueAccent,Colors.teal,Colors.tealAccent]

),
CardDetail(
  titletext: "Save Lives",
  imgurl: "images/give.png",
  cardcoloring: [Colors.green,Colors.greenAccent,Colors.lightGreen,Colors.lightGreenAccent]
),
CardDetail(
  titletext:"Think Big",
  imgurl:"images/smiley.png",
  cardcoloring: [Colors.indigo,Colors.indigoAccent,Colors.deepPurple,Colors.deepPurpleAccent]
),
CardDetail(
  titletext:"Go Big",
  imgurl:"images/stayhome.png",
  cardcoloring: [Colors.cyan,Colors.cyanAccent,Colors.red,Colors.redAccent]
)

];
final  card2 = [
CardDetail(
  titletext: "#India",
  imgurl: "images/family.png",
  cardcoloring: [Colors.orange,Colors.orangeAccent,Colors.red,Colors.redAccent]

),
CardDetail(
  titletext: "Jai Ho",
  imgurl: "images/give.png",
  cardcoloring: [Colors.yellow,Colors.yellowAccent,Colors.lightGreen,Colors.lightGreenAccent]
),
CardDetail(
  titletext:"#Save Humanity",
  imgurl:"images/doctor.png",
  cardcoloring: [Colors.white,Colors.white24,Colors.white54,Colors.white70]
),
CardDetail(
  titletext:"#IndiaJitega",
  imgurl:"images/stayhome.png",
  cardcoloring: [Colors.red,Colors.red[200],Colors.red[500],Colors.red[900]]
)

];

/*["Stay Homes", "Save Lives", "Think Big", "Go"];*/
 
 




