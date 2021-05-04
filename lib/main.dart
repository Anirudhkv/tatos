import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     
  
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Container(
          child: Stack(children: [
            Container(
              child: Text("Welcome Back",style: TextStyle(fontSize: 28,fontWeight:FontWeight.w600,
              color:Color.fromRGBO(96, 56, 32, 1),)
              ),
              padding:EdgeInsets.fromLTRB(25.01, 112.61,24.99, 0),
        
              ),
             Container(
              child: Text("signup or login to see\nour top pics for you",style: TextStyle(fontSize: 17,fontWeight:FontWeight.w300,
              color:Color.fromRGBO(96, 56, 32, 1),)
              ),
              padding:EdgeInsets.fromLTRB(25.01, 161,24.99, 0),
        
              ),
          ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
         
       children:[
          Container(
              child: Text("Email Address",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w600,
              color:Color.fromRGBO(96, 56, 32, 1),)
              ),
     
                  padding:EdgeInsets.fromLTRB(25.01,44,24.99, 0)
              ),
Container(
 
    
      padding: EdgeInsets.only(left:25,top: 15,right: 25,bottom: 20),
      child:  TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
  hintText: "Hint text sample",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
      color: Colors.amber,
      style: BorderStyle.solid,
    ),
  ),
),

      ),
    ),
    Container(
              child: Text("Password",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w600,
              color:Color.fromRGBO(96, 56, 32, 1),)
              ),
     
                  padding:EdgeInsets.fromLTRB(25.01,20,24.99, 0)
              ),
Container(
 
    
      padding: EdgeInsets.only(left:25,top: 15,right: 25,bottom: 20),
      child:  TextField(
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
  hintText: "Hint text sample",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
      color: Colors.amber,
      style: BorderStyle.solid,
    ),
  ),
),

      ),
    ),
   SizedBox(
     width: 400,
     height: 90,
     child: Container(
      
        padding:EdgeInsets.fromLTRB(25, 20, 25, 20),
        child: RaisedButton(
                    child: Text('Login',style: TextStyle(color:Colors.white70),),
                    color:Color.fromRGBO(106, 147, 71, 1),
                    onPressed: () {},
                  ),
     ),
   ),
   Center(
     child: Text("Forgot password ?",style: TextStyle(color: Colors.blue),),
   ),
      Padding(
        
        padding: const EdgeInsets.only(top: 40,bottom: 30),
        child: Center(
     child: Text("Or login with",style: TextStyle(color: Color.fromRGBO(96, 56, 32, 1),),),
   ),
      ),
      SizedBox(
     width: 400,
     height: 90,
     child: Container(
      
        padding:EdgeInsets.fromLTRB(25, 20, 25, 20),
        child: RaisedButton(
                    child: Text('Continue with google',style: TextStyle(color:Colors.white70),),
                    color:Color.fromRGBO(225, 160, 103, 1),
                    onPressed: () {},
                  ),
     ),
   ),
   
],

          ),
        )
      ],)
   
    );
  }
}
