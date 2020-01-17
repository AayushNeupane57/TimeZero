import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import'../utilities/constants.dart';
import '../Inside app/home.dart';
import'./EmailPassword.dart';
import'./Signup.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

    class LoginScreen extends StatefulWidget {


      @override
     _LoginScreenState createState() =>_LoginScreenState();
    }


    class _LoginScreenState extends State<LoginScreen> {

     /* final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignIn googlesignIn = GoogleSignIn();

      Future<String> _signIn() async{
        final GoogleSignInAccount googleacc = await googlesignIn.signIn();
        final GoogleSignInAuthentication googleauth = await googleacc.authentication;
        final AuthCredential credential = await GoogleAuthProvider.getCredential(
            idToken: googleauth.idToken,
            accessToken: googleauth.accessToken);
        final FirebaseUser user = await _auth.signInWithCredential(credential);
      }*/

    bool _rememberMe = false;




     Widget _buildForgotPassword(){
      return Container(
          alignment :Alignment.centerRight,
          child: FlatButton(
              onPressed: () => print('Forgot password pressed'),
              padding : EdgeInsets.only(right: 0.0),
              child: Text(
                'Forgot Password?',
                        style: kLabelStyle,
              )
          )
      );
     }



     Widget _buildRememberMe()
     {
       return   Container(
         height: 20.0,
         child: Row(
           children : <Widget>[
             Theme(
              data:ThemeData.light(),// ThemeData(unselectedWidget:Colors.white),
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
               "Remember me",
             style:kLabelStyle,
             )
           ],
         ),
       );

     }



     Widget _buildLoginBtn()
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
                 'LOGIN',
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




Widget _buildSignUpBtn()
{
  return
  GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    ),
      //print("sign up btn pressed"),
    child: RichText (
        text: TextSpan(
            children: [
              TextSpan(
                text: "Don't have an Account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:18.0,
                  fontWeight: FontWeight.w400,

                ),
              ),

              TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color : Colors.white,
                    fontSize : 18.0,
                    fontWeight: FontWeight.bold,


                  )
              ),


            ]
        )
    ));

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
                          Color(0xFFC89309),
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
                      'Sign In',
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
                    _buildForgotPassword(),
                    _buildRememberMe(),
                    _buildLoginBtn(),
                    EmailPassword("signinwithtext"),
                    EmailPassword("socialbtnrow"),
                    _buildSignUpBtn(),


                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
