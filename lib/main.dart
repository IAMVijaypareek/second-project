import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilerecharge/providers/carouselprovider.dart';
import 'package:mobilerecharge/providers/currenindexprovider.dart';
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
          ChangeNotifierProvider(create: (context) => Cindex())
        ],
        child: MaterialApp(
           // debugShowCheckedModeBanner: false,
            title: 'Beckup Bull',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home:
            
            
            AuthService().handleAuth()));
  }
}
