import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.brown,
          onPressed: () {},
          iconSize: 20,
        ),
        title: Container(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Text(
              "Edit Profile",
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .04,
            ),
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ]),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("asset/images/man.jpg"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                  child: Text('Full name',
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Full name',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown[300]),
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                  child: Text('Street Address',
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Street Address',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown[300]),
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                  child: Text('State/City',
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'State/City',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown[300]),
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                  child: Text('Postal code',
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Postal Code',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown[300]),
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ),
                      Text("SET AS DEFAULT",
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 16,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 40),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            elevation: MaterialStateProperty.all<double>(5)),
                        onPressed: () {},
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
