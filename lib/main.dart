import 'package:flutter/material.dart';
import './loginscreen.dart';
main() => runApp(MyApp());

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
