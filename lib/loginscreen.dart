import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    Widget _buildEmailLTF(){
       return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:<Widget>[
           Text(
             'Email',
//                      style: kLabelStyle:
           ),
           SizedBox(height: 10.0,),
           Container(
             alignment: Alignment.centerLeft,
//                        decoration: kBoxDecorationStyle,
             height: 60.0,
             child: TextField(
               keyboardType: TextInputType.emailAddress,
               style: TextStyle(
                   color: Colors.white,
               fontFamily: 'OpenSans'),
               decoration: InputDecoration(
                 border: InputBorder.none,
                 contentPadding: EdgeInsets.only(top:14.0),
                 prefixIcon: Icon(
                   Icons.email,
                   color: Colors.white,
                 ),
                 hintText :"Enter your Email Address",

               ),
             ),

           ),
         ],
       );
     }





    Widget _buildPasswordLTF(){
       return     Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children:<Widget>[
     Text(
     'Password',
//      style: kLabelStyle:
      ),
      SizedBox(height: 10.0,),
      Container(
      alignment: Alignment.centerLeft,
//                        decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
      obscureText: true,
      style: TextStyle(
      color: Colors.white,
      fontFamily: 'Opensans',
      ),
      decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(top:14.0),
      prefixIcon: Icon(
      Icons.lock,
      color: Colors.white,
      ),
      hintText :"Enter your Password",
//      hintStyle: kHintStyle,

      ),
      ),

      ),
      ],
      );


     }


     Widget _buildForgotPassword(){
      return Container(
          alignment :Alignment.centerRight,
          child: FlatButton(
              onPressed: () => print('Forgot password pressed'),
              padding : EdgeInsets.only(right: 0.0),
              child: Text(
                'Forgot Password?',
//                        style: kLabelStyle,
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
//             style:kLabelStyle,
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
             onPressed: () => print("Login button presses"),
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



 Widget _buildSignInWithText()
{
  return   Column(
      children: <Widget> [
        Text(
          '-OR-',
          style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.w400,

          ),
        ),
        SizedBox(height: 20.0),
        Text('Sign in with',)// style:kLabelStyle),

      ]
  );
}

Widget _buildSocialBtn(Function onTap, AssetImage facebook )
{
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.0,
      width : 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0,2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(
            image: facebook,
        ),
      ),
    ),
  );
}


Widget _buildSocialBtnRow()
{
  return   Padding (
    padding: EdgeInsets.symmetric(vertical :30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:<Widget>[
        _buildSocialBtn(
              () => print("Login With Faceboook"),
          AssetImage(
              'assets/facebook.jpg'),),
        _buildSocialBtn (
              ()=> print("Login in with Google"),
          AssetImage(
              'assets/google.jpg'
          ),
        ),
      ],
    ),
  );
}

Widget _buildSignUpBtn()
{
  return
  GestureDetector(
    onTap: () => print("sign up btn pressed"),
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
                          Color(0xFFE63462),
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
                    _buildEmailLTF(),
                    SizedBox(height: 30.0),
                    _buildPasswordLTF(),
                    _buildForgotPassword(),
                    _buildRememberMe(),
                    _buildLoginBtn(),
                    _buildSignInWithText(),
                    _buildSocialBtnRow(),
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
