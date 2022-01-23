import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualification_flutter/utils/globals.dart' as globals;
import 'package:qualification_flutter/views/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _ctrlUsername = TextEditingController();
  var _ctrlEmail = TextEditingController();
  var _ctrlPassword = TextEditingController();

  bool _valUsername = true;
  bool _valEmail = true;
  bool _valPassword = true;

  bool validateUsername(String username) {
    if (!username.contains(' ') && !username.isEmpty) {
      setState(() {
        _valUsername = true;
      });
      return true;
    }
    setState(() {
      _valUsername = false;
    });
    return false;
  }

  bool validateEmail(String email) {
    if (!email.endsWith('@mail.com')) {
      setState(() {
        _valEmail = false;
      });
      return false;
    }
    setState(() {
      _valEmail = true;
    });
    return true;
  }

  bool validatePassword(String password) {
    if (password.trim().length < 5) {
      setState(() {
        _valPassword = false;
      });
      return false;
    }
    setState(() {
      _valPassword = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_rounded),
                        errorText: _valUsername
                            ? null
                            : 'Username must be filled or must not contains space',
                      ),
                      controller: _ctrlUsername,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                        hintText: 'example@mail.com',
                        prefixIcon: Icon(Icons.email_rounded),
                        errorText: _valEmail
                            ? null
                            : 'Email must ends with "@mail.com"',
                      ),
                      controller: _ctrlEmail,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_rounded),
                          errorText: _valPassword
                              ? null
                              : 'Password must be more than 5 characters!'),
                      controller: _ctrlPassword,
                      obscureText: true,
                    )),
                ElevatedButton(
                    onPressed: () {
                      if (validateUsername(_ctrlUsername.text) &&
                          validateEmail(_ctrlEmail.text) &&
                          validatePassword(_ctrlPassword.text)) {
                        globals.userNow = _ctrlUsername.text;
                        globals.userEmail = _ctrlEmail.text;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return HomePage();
                        }));
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                    ))
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
