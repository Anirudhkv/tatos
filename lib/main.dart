import 'package:flutter/material.dart';
import 'screens/login.dart';
import './screens/create_account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      title: 'Elegant Furnitures',
      home: CreateAccountScreen(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
      },
    );
  }
}
