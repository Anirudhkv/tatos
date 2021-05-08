import 'package:flutter/material.dart';
import 'package:intern/screens/home.dart';
import 'package:intern/utils/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import './login.dart';
import '../utils/email_password.dart';
import '../utils/database.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  var _passwordFocus = FocusNode();
  var _confirmpasswordFocus = FocusNode();
  var _loginFocus = FocusNode();
  var _obscureText = true;
  var _passwordController = TextEditingController();
  var _isLoading = false;
  var check;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordFocus.dispose();
    _loginFocus.dispose();
    _confirmpasswordFocus.dispose();
    _passwordController.dispose();
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

    _formKey.currentState.save();
    setState(() {
      _obscureText = true;
      _isLoading = true;
    });
    signUp(_authData['email'], _authData['password'])
        .then((value) => value != null
            ? showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Success"),
                  content: Text("You have successfully registered"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("okay"),
                    ),
                  ],
                ),
              )
            : showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Failed"),
                  content: Text(
                      "Failed in registering!!\nThis may due to duplicate accounts"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("okay"),
                    ),
                  ],
                ),
              ));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.13),
            Column(
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text('Signing up or login to see \n     our top picks for you.',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                        fontWeight: FontWeight.w300)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: 'Email Address',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.brown[300]),
                                    borderRadius: BorderRadius.circular(7))),
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return "Invalid Email";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocus);
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          Column(
                            children: [
                              TextFormField(
                                controller: _passwordController,
                                textInputAction: TextInputAction.next,
                                focusNode: _passwordFocus,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.brown[300]),
                                      borderRadius: BorderRadius.circular(7)),
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText
                                        ? Icons.lock
                                        : Icons.lock_open),
                                    onPressed: _toggle,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 5) {
                                    return "Password is too short (Min 5)";
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(_confirmpasswordFocus);
                                },
                                onSaved: (value) {
                                  _authData['password'] = value;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015),
                              TextFormField(
                                  textInputAction: TextInputAction.go,
                                  focusNode: _confirmpasswordFocus,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm password',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.brown[300]),
                                        borderRadius: BorderRadius.circular(7)),
                                    suffixIcon: IconButton(
                                      icon: Icon(_obscureText
                                          ? Icons.lock
                                          : Icons.lock_open),
                                      onPressed: _toggle,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Field is empty";
                                    }
                                    if (_passwordController.text != value) {
                                      return "Passwords do not Match";
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(_loginFocus);
                                    _next();
                                  }),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Container(
                                height: 50,
                                child: (_isLoading)
                                    ? CircularProgressIndicator()
                                    : ElevatedButton(
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
                                            'Get Started',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: Row(
                                  children: [
                                    Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.brown),
                                      textAlign: TextAlign.center,
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.of(context)
                                          .pushReplacementNamed(
                                              LoginPage.routeName),
                                      child: Text(
                                        '  Reset here',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              Container(
                                height: 50,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.deepOrange),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                5)),
                                    onPressed: () => {
                                          signInWithGoogle().then((value) => {
                                                check = 1,
                                                if (value != null)
                                                  {
                                                    newUser(check == 1
                                                        ? userId
                                                        : id),
                                                    Navigator.of(context)
                                                        .pushReplacementNamed(
                                                            HomeScreen
                                                                .routeName)
                                                  }
                                                else
                                                  {print("error found")}
                                              })
                                        },
                                    child: Container(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Icon(
                                            MdiIcons.google,
                                            size: 30,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 80, top: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Already an account ?',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.brown),
                                      textAlign: TextAlign.center,
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.of(context)
                                          .pushReplacementNamed(
                                              LoginPage.routeName,
                                              arguments: check),
                                      child: Text(
                                        ' LogIn',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.blue),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ])),
    ));
  }
}
