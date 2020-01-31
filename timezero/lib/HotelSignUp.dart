import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timezero/root.dart';
import 'constants.dart';

class HotelSignUP extends StatefulWidget {
  @override
  _HotelSignUP createState() => _HotelSignUP();
}

class _HotelSignUP extends State<HotelSignUP> {
String email;
String password;
String phone;
String citizen;
String pan;

final _formKey = GlobalKey<FormState>();

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 14.0,
              fontWeight: FontWeight.bold),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'abc@abc.abc',
              hintStyle: kHintTextStyle,
              ),
            onSaved: (String value){
              email = value;
//              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

            },
            validator: ((value) {
              if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                return null;
              }
              return "     Enter valid Email Address";
            })
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintStyle: kHintTextStyle,
             ),



            onSaved: (String value){

              password = value;
            },
              validator: ((String value) {
                if (value.length>8) {
                  return null;
                }
                return "     Password must be greater than 8 digits";
              })

          ),
        ),
      ],
    );
  }



  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone No:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone_android,
                color: Colors.white,
              ),
              hintText: '98X-XXX-XXXX',
              hintStyle: kHintTextStyle,
            ),
              onSaved: (String value){

                phone = value;
              },
              validator: ((String value) {
                if (RegExp(r'^(9)(8)?[0-9]{8}$').hasMatch(value)) {
                  return null;
                }
                return "     Enter Valid Phone Number";
              })

          ),
        ),
      ],
    );
  }

  Widget _buildCitizenTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'CitizenShip No:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.credit_card,
                color: Colors.white,
              ),
              hintText: 'XX-XX-XXXX-XXXX',
              hintStyle: kHintTextStyle,
            ),
              onSaved: (String value){

                citizen = value;
              },
              validator: ((String value) {
                if (RegExp(r'^[0-9]{2}?(-)?[0-9]{2}(-)?[0-9]{4}(-)?[0-9]{4}$').hasMatch(value)) {
                  return null;
                }
                return "     Enter Valid citizenship  Number";
              })

          ),
        ),
      ],
    );
  }

  Widget _buildPanTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'PAN NO:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.restaurant_menu,
                color: Colors.white,
              ),
              hintText: 'XXXX-XXXX-XXXX',
              hintStyle: kHintTextStyle,
            ),
              onSaved: (String value){

                citizen = value;
              },
              validator: ((String value) {
                if (RegExp(r'^[0-9]{4}?(-)?[0-9]{4}(-)?[0-9]{4}(-)?[0-9]{4}$').hasMatch(value)) {
                  return null;
                }
                return "     Enter Valid Pan  Number";
              })

          ),
        ),
      ],
    );
  }






  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (_formKey.currentState.validate())
            {
              _formKey.currentState.save();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHome()),
              );
            }
          else
            {
          setState(() {

            });
            }
          },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFC89309),],
                    stops: [1],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up for Restaurant',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          '*All fields are required',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 30.0),

                        _buildEmailTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        SizedBox(height: 30.0),
                        _buildPhoneTF(),
                        SizedBox(height: 30.0),
                        _buildCitizenTF(),
                        SizedBox(height: 30.0),
                        _buildPanTF(),
                        _buildLoginBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
