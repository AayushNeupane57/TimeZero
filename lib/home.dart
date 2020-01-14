import 'package:flutter/material.dart';
import 'components.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(
          color: Colors.blueAccent,

        )
      ),
      body:Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              ContainerWithSize(100, 100, "Exp"),
              SizedBox(
                width: 5,
              ),
              Column(
                children: <Widget>[
                  ContainerWithSize(50,100,"fast foods"),
                  SizedBox(
                    height: 1,
                  ),

                  ContainerWithSize(50,100," Dinners"),
                ],
              ),
              SizedBox(
                width:5,
              ),
              Column(
                children: <Widget>[
                  ContainerWithSize(50,100,"Hotels"),
                  SizedBox(
                    height: 1,
                  ),
                  ContainerWithSize(50,100,"Resturants"),
                ],
              )
            ]
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right:120),
            child: Text(
                "Popular Items ",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black12,
              ),

            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
           ],

          )
        ],
        )
    );
  }
}