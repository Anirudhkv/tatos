import 'package:flutter/material.dart';
import '../utils/google_sign_in.dart';
import '../utils/email_password.dart';
import '../screens/checkout.dart';

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: check == 1
                    ? NetworkImage(imageUrl)
                    : AssetImage('asset/images/propic.png'),
              ),
              check == 1
                  ? Text(
                      name,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  : (displayName != null
                      ? Text(
                          displayName,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        )
                      : Text(
                          '',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        )),
              Text(
                check == 1 ? '$email' : emailId,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red[400],
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal[900],
                    ),
                    title: check == 1
                        ? (phoneNumber != null
                            ? Text(
                                phoneNumber,
                                style: TextStyle(fontSize: 20.0),
                              )
                            : Text(
                                'No number added',
                                style: TextStyle(fontSize: 20.0),
                              ))
                        : (phone != null
                            ? Text(
                                phone,
                                style: TextStyle(fontSize: 20.0),
                              )
                            : Text(
                                'No number added',
                                style: TextStyle(fontSize: 20.0),
                              )),
                  )),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.cake,
                    color: Colors.teal[900],
                  ),
                  title: Text(
                    '08-05-1995',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.teal[900],
                  ),
                  title: Text(
                    'Address',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
