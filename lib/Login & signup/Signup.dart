import 'package:flutter/material.dart';
import '../Inside app/home.dart';
import './EmailPassword.dart';
//import 'package:firebase_auth/firebase_auth.dart';


  class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() =>_SignUpScreenState();
}



class _SignUpScreenState extends State<SignUpScreen> {
Widget _buildSignUpBtn()
  {
    return Container(
      padding : EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child : RaisedButton(
          elevation:5.0,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home2()),
          ),         //print("Login button presses"),
          padding : EdgeInsets.all(15.0),
          shape : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),


          ),
          color: Colors.white,
          child:Text(
              'SIGNUP',
              style:TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize:18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',


              )
          )
      ),
    );
  }





  @override
  Widget build(BuildContext context){
    return Scaffold(body:
    Stack(
      children: <Widget>[
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFD31E15),
//                  Color(0xFFE63462),
//                  Color(0xFFE63462),
//                  Color(0xFFE63462),
                    ],
                    stops: [1]
                )
            )
        ),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                EmailPassword("email"),
                SizedBox(height: 30.0),
                EmailPassword("password"),
                _buildSignUpBtn(),
                EmailPassword("signupwithtext"),
                EmailPassword("socialbtnrow"),


              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
}
