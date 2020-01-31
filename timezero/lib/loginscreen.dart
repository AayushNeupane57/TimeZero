import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timezero/HotelDashboard.dart';
import 'package:timezero/HotelSignUp.dart';
import 'package:timezero/root.dart';
import 'constants.dart';
import 'home.dart';
import "auth.dart";
import 'dart:async';
import'HotelDashboard.dart';

String email;
String password;

//Navigator.push(context, route)
//SignInUP(mainText:"Sign In",isSignIn:true)

class SignInUP extends StatefulWidget {
  String mainText;
  bool isSignIn;

  SignInUP({this.mainText,this.isSignIn});
  @override
  _SignInUPState createState() => _SignInUPState(mainText:mainText ,isSignIn:isSignIn );
}

class _SignInUPState extends State<SignInUP> {
  _SignInUPState({this.mainText,this.isSignIn});
  String mainText;

  bool isSignIn;

  Auth auth = new Auth();

  bool _rememberMe = false;

  Widget _buildForgotPassword() {
    return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
            onPressed: () {

              print('Forgot password pressed');
              },
            padding: EdgeInsets.only(right: 0.0),
            child: Text(
              'Forgot Password?',
              style: kLabelStyle,
            )));
  }

  Widget _buildRememberMe() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data:
            ThemeData.light(), // ThemeData(unselectedWidget:Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            "Login as Hotel?",
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,      child:RaisedButton(
          elevation: 5.0,
          onPressed: () {
            if (_rememberMe)
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelDashboard()));
              }
            else {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
            );
            }


          }
//          onPressed: () async {
//            if(isSignIn)
//              {
//                AuthResult result = await auth.signIn(email, password);
//                if( result!=null){
//                  FirebaseUser user = await auth.currentuser();
//                  print("${user.displayName} has signed in");
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => Home()),
//                  );
//                }
//                else
//                {
//                  print("unsucessful");
//                }
//              }
//            else
//            {
//              AuthResult result = await auth.signUp(email, password);
//              if( result !=null){
//                FirebaseUser user = await auth.currentuser();
//                print("${user.email} has signed up");
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => Home()),
//                );
//              }
//              else
//              {
//                print("unsucessful");
//              }
//            }
//
//          }, //print("Login button presses"),
          ,padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(mainText,
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ))),
    );
    
  }

  Widget _buildSignUpBtn() {
    return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInUP(mainText:"Sign Up",isSignIn: false,)),
        ),
        child: Text(
              "Consumer",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }
  Widget _buildSignUpBtnAsHotel() {
    return GestureDetector(
        onTap: ()
      {
        print("hotel sign up");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelSignUP(),
            ));

      },
        child: Text(
          "Hotel",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFC89309),
                        //                  Color(0xFFE63462),
                        //                  Color(0xFFE63462),
                        //                  Color(0xFFE63462),
                      ],
                      stops: [
                        1
                      ]))),
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
                    mainText,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  //EmailOrPwFields is an custom class which extends stateless widgets and is defined below
                  EmailField(fieldName:"Email", hintText:"Enter Your Email Address"),
                  SizedBox(height: 30.0),
                  PasswordField(fieldName:"Password", hintText:"Enter Your Password"),

                  (isSignIn)?_buildForgotPassword():SizedBox(height: 10,),
                  (isSignIn)?_buildRememberMe():SizedBox(height: 10,),
                  _buildLoginBtn(),
                  (isSignIn)? Align(
                    alignment: Alignment.center,

                    child: Column(
                      children: <Widget>[
                        Text(
                          '-OR-',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ):SizedBox(height: 20,),
                  (isSignIn)?Text("dont have an account? Sign Up as:", style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )):SizedBox(height: 10,),
                  (isSignIn)?_buildSignUpBtn():SizedBox(height: 10,),

                  (isSignIn)?_buildSignUpBtnAsHotel():SizedBox(height: 10,),



                  (isSignIn)?
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async{
                            AuthResult result = await auth.googlelogin();
                            if (result!=null) {
                              FirebaseUser user = await auth.currentuser();
                              print("${user.displayName} has signed in with google");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHome(),
                                  ));
                            }
                            else{
                              setState(() {
                                print("Signin with google failed");
                              });
                            }
                          },

                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 50.0,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage('assets/google.png'),
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            AuthResult result = await auth.facebooklogin();
                            if (result != null) {
                              FirebaseUser user = await auth.currentuser();
                              print("${user.displayName} has signed in with Facebook");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHome(),
                                  ));
                            }
                            else{
                              setState(() {
                                print("Signin with Facebook failed");
                              });
                            }
                          },

                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 50.0,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage('assets/facebook.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):SizedBox(height: 5,),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class EmailField extends StatelessWidget {
  final String fieldName;
  final String hintText;

  EmailField({this.fieldName,this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          fieldName,
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: hintText,
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value){

              email = value;
            },
          ),
        ),],);
  }
}

class PasswordField extends StatelessWidget {
  final String fieldName;
  final String hintText;

  PasswordField({this.fieldName,this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          fieldName,
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: hintText,
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value){
              password = value;
            },
          ),
        ),],);
  }
}