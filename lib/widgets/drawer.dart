import 'package:flutter/material.dart';
import 'package:intern/utils/google_sign_in.dart';
import 'package:intern/utils/email_password.dart';
import '../screens/login.dart';

class MainDrawer extends StatelessWidget {
  final check;
  MainDrawer(this.check);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: check == 1 ? Text(name) : null,
            accountEmail: check == 1 ? Text(email) : Text(emailId),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                check == 1 ? "${name[0]}" : "${emailId[0].toUpperCase()}",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.perm_identity_sharp),
            title: Text("Sign Out"),
            onTap: () {
              check == 1 ? signOutGoogle() : signOut();
              Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
