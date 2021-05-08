import 'package:flutter/material.dart';
import 'package:intern/screens/checkout.dart';
import 'package:intern/screens/rough.dart';
import 'screens/login.dart';
import './screens/create_account_screen.dart';
import './screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Colors.brown,
        accentColor: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Elegant Furnitures',
      home: CreateAccountScreen(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomeScreen.routeName: (context) => HomeScreen(),
        Checkout.routeName: (context) => Checkout(),
        UserScreen.routeName: (context) => UserScreen()
      },
    );
  }
}
