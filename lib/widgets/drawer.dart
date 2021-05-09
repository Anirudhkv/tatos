import 'package:flutter/material.dart';
import 'package:intern/utils/google_sign_in.dart';
import 'package:intern/utils/email_password.dart';
import '../screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(id)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              return UserAccountsDrawerHeader(
                accountName: check == 1
                    ? Text(name)
                    : (snapshot.data['name'] != null
                        ? Text(snapshot.data['name'])
                        : null),
                accountEmail: check == 1 ? Text(email) : Text(emailId),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    check == 1 ? "${name[0]}" : "${emailId[0].toUpperCase()}",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              );
            },
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
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
