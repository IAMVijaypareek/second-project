import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilerecharge/providers/carousel_provider/carousel_provider.dart';
import 'package:mobilerecharge/providers/carousel_provider/current_index_provider.dart';
import 'package:mobilerecharge/providers/location_provider/loc_provider.dart';
import 'package:mobilerecharge/widgets/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<FirebaseUser>.value(
              value: FirebaseAuth.instance.onAuthStateChanged),
          ChangeNotifierProvider(create: (_) => Carouselcard()),
          // ChangeNotifierProvider(create: (context) => TimerInfo()),
          ChangeNotifierProvider(create: (context) => Carouselcard()),
          ChangeNotifierProvider(create: (context) => Cindex()),
          ChangeNotifierProvider(create: (context) => LocationProvide())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Beckup Bull',
            theme: ThemeData(
              //canvasColor: Colors.transparent,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: AuthService().handleAuth()));
  }
}
