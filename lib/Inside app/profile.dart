import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
          Column(
          children : <Widget>[
      Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 80.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
          'Hi! Aaditya Subedi , Good Morning',
            style:TextStyle(
              color: Colors.red,
              letterSpacing: 1.5,
              fontSize:20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',


                ),
          ),
              SizedBox(height: 30),
            Column(
             children:<Widget> [Image.asset("assets/Profile.jpg",

            height: 100,
            width : 100,
          ),
             ]
          ),
        ],
          ),
        )
          ),
    ]
    )
    );
  }
}
