import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:mobilerecharge/models/reuse.dart';
import 'package:mobilerecharge/providers/carouselprovider.dart';
import 'package:mobilerecharge/providers/currenindexprovider.dart';
import 'package:mobilerecharge/services/remoteconfigservies.dart';
import 'package:mobilerecharge/widgets/builddots.dart';
import 'package:mobilerecharge/widgets/drawer.dart';
import 'package:mobilerecharge/widgets/getting.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _currentPage=0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    print("init");
  }

  /* @override
  void initState() {
    super.initState()
    imer.periodic(Duration(seconds: 1), (t) {
      var timerInfo = Provider.of<TimerInfo>(context, listen: false);
      timerInfo.updateRemainingTime();
    } 
    );
  }*/
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget build(BuildContext context) {
    print("build h bhai");

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            )),
        centerTitle: true,
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                child: Center(
                  child: Icon(
                    Icons.notification_important,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ),
              Positioned(
                top: 10.0,
                height: 15.0,
                width: 15.0,
                child: Center(
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Center(
                          child: Text(
                        "0",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:  FutureBuilder<RemoteConfig>(
        future: setupRemoteConfig(),
        builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
          print("Future of remote");
              return snapshot.hasData
              ? WelcomeWidget(remoteConfig: snapshot.data)
              : Container();
        },
      ),
              ),
              Container(
                height: 200,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (int index) {
                      Cindex currentindep =
                          Provider.of<Cindex>(context, listen: false);
                      currentindep.pagechange(index);
                    },
                    itemCount: card1.length,
                    itemBuilder: (context, index) {
                      return listcard(card1[index]);
                    }),
              ),
              SizedBox(height: 5.0),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Consumer<Cindex>(builder: (context, data, child) {
                      return BuilDots(
                          numberOfDots: card1.length,
                          photoIndex: data.getcurrentindex() ?? 0);
                    })
                  ],
                ),
              ),
              bodywidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Save Lives',
                          //GoogleFonts.lato(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              cardgroup(
                                  Icon(Icons.security,
                                      size: 50.0, color: Colors.green),
                                  "PM Cares",
                                  "Fund"),
                              cardgroup(
                                  Icon(Icons.cake,
                                      size: 50.0, color: Colors.cyan),
                                  "Food Your",
                                  "City"),
                              cardgroup(
                                  Icon(Icons.check_box,
                                      size: 50.0, color: Colors.tealAccent),
                                  "Donate for",
                                  "Animals"),
                            ]),
                      ],
                    )),
              ),
              Stack(children: <Widget>[
                Container(
                  child:
                      Consumer<Carouselcard>(builder: (context, data, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: BuilDots(
                              numberOfDots: card2.length,
                              photoIndex: data.getphotoIndexx() ?? 0),
                        ),
                        Container(
                            child: listcard(
                          card2[data.getphotoIndexx() ?? 0],
                        )),
                      ],
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          print("previous");
                          var carousel =
                              Provider.of<Carouselcard>(context, listen: false);
                          carousel.previousImage();
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 150.0,
                            color: Colors.transparent)),
                    GestureDetector(
                        onTap: () {
                          print("next");
                          var carousel =
                              Provider.of<Carouselcard>(context, listen: false);
                          carousel.nextImage();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 150.0,
                          color: Colors.transparent,
                        )),
                  ],
                )
              ]),

              /* Container(child: Consumer<TimerInfo>(
                builder: (context, data, child) {
                 // print("object");
                  return Text(
                    data.getRemainingTime().toString() ?? "",
                    style: TextStyle(fontSize: 72.0),
                  );
                },
              ))*/
              SizedBox(height: 50.0),
              Image.asset("images/doctors.png"),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => GettingStartedScreen()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: Container(
          width: MediaQuery.of(context).size.width * .90, child: DrawerTab()),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.phone_iphone),
            title: new Text('Recharge'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget bodywidget() {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.phone_android,
                          size: 50.0, color: Colors.blueAccent),
                      SizedBox(height: 20.0),
                      Text(
                        "Recharge",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              )),
              GestureDetector(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.library_books,
                          size: 50.0, color: Colors.blueAccent),
                      SizedBox(height: 20.0),
                      Text(
                        "Passbook",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              )),
              GestureDetector(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.monetization_on,
                          size: 50.0, color: Colors.blueAccent),
                      SizedBox(height: 20.0),
                      Text(
                        "Insurance",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              )),
            ]),
      ),
    );
  }

  Widget cardgroup(icon, iconname1, iconname2) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Container(
        child: GestureDetector(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              Text(
                iconname1,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                iconname2,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )),
          onTap: () {},
        ),
      ),
    );
  }

  Widget listcard(item) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: item.cardcoloring
              /* Colors.blue,
            Colors.blueAccent,
            coloring,
            Colors.cyan,
            Colors.cyanAccent,*/
              ,
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight),
        ),
        height: 150.0,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget>[
          Container(
            //color: Colors.pink,
            child: Center(
              child: Text(
                item.titletext,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
              right: 15.0,
              top: 60.0,
              child: Container(
                height: 80.0,
                child: Image.asset(/*"images/family.png"*/ item.imgurl),
              )),
          Positioned(
              left: 15.0,
              top: 40.0,
              child: Container(
                height: 80.0,
                child: Image.asset(/*"images/stayhome.png"*/ item.imgurl),
              )),
          Positioned(
              right: 0.0,
              top: 10.0,
              child: Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width / 2,

                //color:Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),

                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "#india",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.headset, color: Colors.pink),
                      Image.asset("images/give.png"),
                      Image.asset("images/smiley.png")
                    ],
                  ),
                )),
              )),
        ]));
  }
}
