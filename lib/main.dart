import 'package:flutter/material.dart';
import './Login & signup/loginscreen.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: LoginScreen(),

      ),
    );
  }
}
