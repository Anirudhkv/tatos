import 'package:flutter/material.dart';
import "package:intern/utils/google_sign_in.dart";

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(  
        child: ListView(  
          // Important: Remove any padding from the ListView.  
          padding: EdgeInsets.zero,  
          children: <Widget>[  
            UserAccountsDrawerHeader(  
              accountName: Text(name),  
              accountEmail: Text(email),  
              currentAccountPicture: CircleAvatar(  
                backgroundColor: Colors.orange,  
                child: Text(  
                  "${name[0]}",  
                  style: TextStyle(fontSize: 40.0),  
                ),  
              ),  
            ),  
            ListTile(  
              leading: Icon(Icons.home), title: Text("Home"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.settings), title: Text("Settings"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("Contact Us"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ), 
              ListTile(  
                leading: Icon(Icons.logout),
              title: Text("Logout"),  
              onTap: () {  
                 signOutGoogle();
              Navigator.of(context).pushReplacementNamed('/');

              },  
            ), 

          ],  
        ),  
      )  
      ;
  }
}
