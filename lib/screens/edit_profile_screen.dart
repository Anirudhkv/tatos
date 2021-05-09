import 'package:flutter/material.dart';
import 'package:intern/utils/google_sign_in.dart';
import '../utils/database.dart';
import '../utils/email_password.dart';
import '../widgets/customdiaglog.dart';
import '../widgets/spinner.dart';

class Checkout extends StatefulWidget {
  static const routeName = "/checkout";

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool isSwitched = false;
  var _isLoading = false;
  final formKey = GlobalKey<FormState>();
  Map<String, String> _updateData = {
    'name': '',
    'street-address': '',
    'state': '',
    'postal-code': '',
    'phone-number': ''
  };

  void _next(check) {
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    addOrUpdateUser(
            check == 1 ? userId : id,
            _updateData['name'],
            _updateData['street-address'],
            _updateData['state'],
            _updateData['postal-code'],
            _updateData['phone-number'])
        .then((value) => {
              if (value == 'Success')
                {
                  setState(() {
                    _isLoading = true;
                  }),
                  showDialog(
                    context: context,
                    builder: (ctx) => SuccessDialog(
                        "Profile Updated",
                        "Profile have been updated successfully",
                        Icons.done_sharp,
                        Theme.of(context).dialogBackgroundColor),
                  ),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    final check = ModalRoute.of(context).settings.arguments;
    final appBar = AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.brown,
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 20,
        ),
        title: Text('Edit Profile',
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
        centerTitle: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(children: [
            SizedBox(
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
                backgroundImage: check == 1
                    ? NetworkImage(imageUrl)
                    : AssetImage('asset/images/propic.png'),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            hintText: 'Full name',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.brown[300]),
                                borderRadius: BorderRadius.circular(7))),
                        onSaved: (value) {
                          _updateData['name'] = value;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                    child: Text('Phone Number',
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.brown[300]),
                                borderRadius: BorderRadius.circular(7))),
                        onSaved: (value) {
                          _updateData['phone-number'] = value;
                        }),
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            hintText: 'Street Address',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.brown[300]),
                                borderRadius: BorderRadius.circular(7))),
                        onSaved: (value) {
                          _updateData['street-address'] = value;
                        }),
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
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor),
                          ),
                          hintText: 'State/City',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown[300]),
                              borderRadius: BorderRadius.circular(7))),
                      onSaved: (value) {
                        _updateData['state'] = value;
                      },
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            hintText: 'Postal Code',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.brown[300]),
                                borderRadius: BorderRadius.circular(7))),
                        onSaved: (value) {
                          _updateData['postal-code'] = value;
                        }),
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
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 40),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(106, 147, 71, 1)),
                              elevation: MaterialStateProperty.all<double>(5)),
                          onPressed: () => _next(check),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Update',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          _isLoading
              ? Loader(isCustom: true, loadingTxt: 'Updating Datas')
              : Container()
        ]),
      ),
    );
  }
}
