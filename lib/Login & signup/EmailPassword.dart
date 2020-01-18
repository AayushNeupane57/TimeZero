import 'package:flutter/material.dart';
import'../utilities/constants.dart';

class EmailPassword extends StatelessWidget {





String text(String txt)
{
  return "Sign "+ txt+" with";

}


  Widget _buildEmailLTF(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Email',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextFormField(
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
            hintStyle: kHintTextStyle,

          ),
          onSaved:(String value){
            print("value entered");

          },
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
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextFormField(
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
            hintStyle: kHintTextStyle,

          ),
        ),

      ),
    ],
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
              blurRadius: 50.0,
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
                'assets/facebook.png'),),
          _buildSocialBtn (
                ()=> print("Login in with Google"),
            AssetImage(
                'assets/google.png'
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInWithText(String txt)
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
          Text(text(txt),style:kLabelStyle)
          ,

        ]
    );
  }

final String word;

EmailPassword(this.word);
@ override
    Widget build(BuildContext context){
if (word=="email")
  {return _buildEmailLTF();}
else if (word== "password")
  {  return _buildPasswordLTF();}
else if(word =="socialbtnrow")
  {return _buildSocialBtnRow();}
else if(word == "signupwithtext")
  {return _buildSignInWithText("up");}
else if(word == "signinwithtext")
{return _buildSignInWithText("in");}

}
    }