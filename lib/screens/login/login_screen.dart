//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Declare all the states required for this screen. This part should be done in this file.
//      You may also want to define getters and setters for the states.
//      The states should include:
//        a. username
//        b. password
//        b. show or hide the password
//        c. show or hide the error message 'invalid username or password'
//
//   2. Build the UI by composing from its components, i.e., Body.
//      Besides, you will also need to pass the 'states' to the component.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _username = '';
  String _password = '';
  bool _isObscured = true;
  String _feedback = "";

  get username => _username;
  set username(value) => setState(() {
        _username = value;
      });

  get password => _password;
  set password(value) => setState(() => _password = value);

  get isObscured => _isObscured;
  set isObscured(value) => setState(() => _isObscured = value);

  get feedback => _feedback;
  set feedback(value) => setState(() => _feedback = value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          body: Body(
            state: this,
          ),
        ),
      ),
    );
  }
}
