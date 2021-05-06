import 'package:flutter/material.dart';
import 'package:intern/screens/checkout.dart';
import 'screens/login.dart';
import './screens/create_account_screen.dart';
import './screens/home.dart';

void main() {
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
      home: Checkout(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomeScreen.routeName: (context) => HomeScreen()
      },
    );
  }
}