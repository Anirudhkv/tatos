import 'package:flutter/material.dart';
import './home.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _passwordFocus = FocusNode();
  var _loginFocus = FocusNode();
  var _obscureText = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordFocus.dispose();
    _loginFocus.dispose();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _next() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    //_formKey.currentState.save();
    setState(() {
      _obscureText = true;
    });
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text('Signing up or \nlogin to see our top picks for you.',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email Address',
                                      style: TextStyle(
                                          color: Colors.brown,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.brown[300]),
                                            borderRadius:
                                                BorderRadius.circular(7))),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Email Id not entered";
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(_passwordFocus);
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                  Text('Password',
                                      style: TextStyle(
                                          color: Colors.brown,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Column(
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015),
                                      TextFormField(
                                          textInputAction: TextInputAction.done,
                                          focusNode: _passwordFocus,
                                          obscureText: _obscureText,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown[300]),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            suffixIcon: IconButton(
                                              icon: Icon(_obscureText
                                                  ? Icons.lock
                                                  : Icons.lock_open),
                                              onPressed: _toggle,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Password not entered";
                                            }
                                            return null;
                                          },
                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context)
                                                .requestFocus(_loginFocus);
                                            _next();
                                          }),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      Container(
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.green),
                                                elevation: MaterialStateProperty
                                                    .all<double>(5)),
                                            onPressed: _next,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text(
                                                'Log In',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Forgot Password? ',
                                          style: TextStyle(
                                              color: Colors.brown,
                                              fontFamily: 'Lato'),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Reset password',
                                                style: TextStyle(
                                                    color: Colors.blueGrey)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07),
                                      Text(
                                        'Or Login with',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.brown),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Container(
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Colors.deepOrange),
                                                elevation: MaterialStateProperty
                                                    .all<double>(5)),
                                            onPressed: () => {},
                                            child: Container(
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    MdiIcons.google,
                                                    size: 30,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1),
                                                  Text(
                                                    'Continue with Google',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ]))),
    ));
  }
}