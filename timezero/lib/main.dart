import 'package:flutter/material.dart';
import 'loginscreen.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SignInUP(mainText:"Sign In",isSignIn:true),

      ),
    );
  }
}
