import 'package:flutter/material.dart';
import 'package:qualification_flutter/views/pages/home.dart';
import 'package:qualification_flutter/views/pages/items.dart';
import 'package:qualification_flutter/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black, fontFamily: 'Poppins'),
        home: Scaffold(
          body: LoginPage(),
        ));
  }
}
