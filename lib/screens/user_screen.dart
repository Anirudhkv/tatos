import 'package:flutter/material.dart';
import '../utils/google_sign_in.dart';
import '../utils/email_password.dart';
import '../screens/checkout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user_screen';
  @override
  Widget build(BuildContext context) {
    final check = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => {
                        Navigator.of(context)
                            .pushNamed(Checkout.routeName, arguments: check)
                      })
            ],
            elevation: 0,
            backgroundColor: Colors.white,
            brightness: Brightness.dark,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.brown,
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 20,
            )),
        body: StreamBuilder(
          stream: check == 1
              ? FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection('users')
                  .doc(id)
                  .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print('Error occured');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              Center(child: CircularProgressIndicator());
            }
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: check == 1 ? userId : id,
                      child: Container(
                         decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ]
              ),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: check == 1
                              ? NetworkImage(imageUrl)
                              : AssetImage('asset/images/propic.png'),
                        ),
                      ),
                    ),
                    check == 1
                        ? (snapshot.data['name'] != null
                            ? Text(
                                snapshot.data['name'],
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              )
                            : Text(
                                name,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ))
                        : (snapshot.data['name'] != null
                            ? Text(
                                snapshot.data['name'],
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              )
                            : Text(
                                '',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              )),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(
                        check == 1 ? '$email' : emailId,
                        style: TextStyle(
                          fontSize: 18,
                          color:Theme.of(context).accentColor,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 200,
                      child: Divider(
                        color: Colors.teal[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Card(
                      
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.teal[900],
                            ),
                            title: check == 1
                                ? (snapshot.data['phone'] != null
                                    ? Text(
                                        snapshot.data['phone'],
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    : Text(
                                        'No number added',
                                        style: TextStyle(fontSize: 20.0),
                                      ))
                                : (snapshot.data['phone'] != null
                                    ? Text(
                                        snapshot.data['phone'],
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    : Text(
                                        'No number added',
                                        style: TextStyle(fontSize: 20.0),
                                      )),
                          )),
                    ),
                    Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.teal[900],
                        ),
                        title: check == 1
                            ? (snapshot.data['address'] != null
                                ? Text(
                                    snapshot.data['address'],
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                : Text(
                                    'No address added',
                                    style: TextStyle(fontSize: 20.0),
                                  ))
                            : (snapshot.data['address'] != null
                                ? Text(
                                    snapshot.data['address'],
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                : Text(
                                    'No number added',
                                    style: TextStyle(fontSize: 20.0),
                                  )),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.pin_drop_outlined,
                          color: Colors.teal[900],
                        ),
                        title: check == 1
                            ? (snapshot.data['pincode'] != null
                                ? Text(
                                    snapshot.data['pincode'],
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                : Text(
                                    'No pincode added',
                                    style: TextStyle(fontSize: 20.0),
                                  ))
                            : (snapshot.data['pincode'] != null
                                ? Text(
                                    snapshot.data['pincode'],
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                : Text(
                                    'No pincode added',
                                    style: TextStyle(fontSize: 20.0),
                                  )),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
