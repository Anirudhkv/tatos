import 'package:flutter/material.dart';
import 'package:intern/screens/edit_profile_screen.dart';
import 'package:intern/screens/product_screen.dart';
import 'screens/login_screen.dart';
import './screens/create_account_screen.dart';
import 'screens/home_screen.dart';
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
          accentColor: Color.fromRGBO(225, 160, 103, 1),
          dialogBackgroundColor: Color.fromRGBO(106, 147, 71, 1)),
      debugShowCheckedModeBanner: false,
      title: 'Elegant Furnitures',
      home: CreateAccountScreen(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomeScreen.routeName: (context) => HomeScreen(),
        Checkout.routeName: (context) => Checkout(),
        UserScreen.routeName: (context) => UserScreen(),
        ProductScreen.routeName: (context) => ProductScreen(),
        CreateAccountScreen.routeName: (context) => CreateAccountScreen(),
      },
    );
  }
}
