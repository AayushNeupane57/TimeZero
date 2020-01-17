import 'package:flutter/material.dart';
import'dart:math';

class Profile extends StatelessWidget {
  final List <int> a = [10, 20, 30, 40];
  final List<String> foodImages = [
    "assets/burger.jpg",
    "assets/momo.jpg",
    "assets/pizza.jpg",
    "assets/chowmin.jpg",
  ];
  static var random = Random.secure();

  var index = random.nextInt(4);
  String userName="UserName";
  String phoNo ="+97798XXXXXXXX";
  int visitedRestaurant = 23;
  int waiting = 4;
  int bonusPoint = 100;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: const Color(0xFFC89309),
      body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Image.asset(foodImages[index], fit: BoxFit.cover,),
            ),
            DraggableScrollableSheet(
                minChildSize: 0.1,
                initialChildSize: 0.22,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                          constraints: BoxConstraints(minHeight: MediaQuery
                              .of(context)
                              .size
                              .height),
                          color: Color(0xFFD31E15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[

                                Container(

                                  padding: EdgeInsets.only(
                                      left: 32, right: 32, top: 32),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: <Widget>[
                                        SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/google.png',
                                                fit: BoxFit.cover,),
                                            )
                                        ),
                                        SizedBox(width: 16,),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[
                                                  Text(userName,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey[800],
                                                        fontSize: 36,
                                                        fontWeight: FontWeight
                                                            .w700),),

                                                  Text(phoNo,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey[800],
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .w400),),


                                                ]
                                            )
                                        ),


                                      ]
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Container(
                                  padding: EdgeInsets.all(32),
                                  color: Colors.blue,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: <Widget>[
                                        Column(
                                            children: <Widget>[
                                              Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: <Widget>[
                                                    Icon(Icons.check_box,
                                                        color: Colors.white,
                                                        size: 30),
                                                    SizedBox(width: 4),
                                                    Text(visitedRestaurant.toString(), style:
                                                    TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontSize: 24,
                                                    )
                                                    )
                                                  ]

                                              ),
                                              Text(
                                                  "VIsited Restaurant", style:
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,


                                              )
                                              )
                                            ]

                                        ),

                                        Column(
                                            children: <Widget>[
                                              Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: <Widget>[
                                                    Icon(Icons.access_alarm,
                                                        color: Colors.white,
                                                        size: 30),
                                                    SizedBox(width: 4),
                                                    Text(waiting.toString(), style:
                                                    TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontSize: 24,
                                                    )
                                                    )
                                                  ]

                                              ),
                                              Text("Waiting", style:
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,


                                              )
                                              )
                                            ]

                                        ),

                                        Column(
                                            children: <Widget>[
                                              Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: <Widget>[

                                                    SizedBox(width: 4),
                                                    Text(("Rs."+ bonusPoint.toString()), style:
                                                    TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontSize: 24,
                                                    )
                                                    )
                                                  ]

                                              ),
                                              Text("Bonus point", style:
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,


                                              )
                                              )
                                            ]

                                        )


                                      ]
                                  ),

                                ),
                                SizedBox(height: 16,),
                                Container(
                                    padding: EdgeInsets.all(32),
                                    color: Color(0xFFe86427),
                                    child: Column(
                                        children: <Widget>[
                                          SizedBox(height:25),
                                          Row(children: <Widget>
                                          [
                                            Icon(Icons.add,
                                                color: Colors.black,
                                                size: 35),
                                            SizedBox(width: 20),
                                            Text("Invite & earn", style:
                                            TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,

                                            ))
                                          ]),
                                          SizedBox(height:25),
                                          Row(children: <Widget>
                                          [
                                            Icon(Icons.calendar_today,
                                                color: Colors.black,
                                                size: 35),
                                            SizedBox(width: 20),
                                            Text("My Bookings", style:
                                            TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,

                                            ))
                                          ]),
                                          SizedBox(height:25),
                                          Row(children: <Widget>
                                          [
                                            Icon(Icons.settings,
                                                color: Colors.black,
                                                size: 35),
                                            SizedBox(width: 20),
                                            Text("Settings", style:
                                            TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,

                                            ))
                                          ]),
                                          SizedBox(height:25),
                                          Row(children: <Widget>
                                          [
                                            Icon(Icons.help,
                                                color: Colors.black,
                                                size: 35),
                                            SizedBox(width: 20),
                                            Text("Help & Support", style:
                                            TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,

                                            ))
                                          ]),
                                          SizedBox(height:25),
                                          Row(children: <Widget>
                                          [
                                            Icon(Icons.info,
                                                color: Colors.black,
                                                size: 35),
                                            SizedBox(width: 20),
                                            Text("About", style:
                                            TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,

                                            ))
                                          ]),

                                          SizedBox(height:25),
                                          Row(children: <Widget>
                                          [
                                            Icon(Icons.exit_to_app,
                                                color: Colors.black,
                                                size: 35),
                                            SizedBox(width: 20),
                                            Text("Log out", style:
                                            TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,

                                            ))
                                          ]),
                                          SizedBox(height:25),




                                        ]
                                    )
                                )

                              ]
                          )

                      ));
                })
          ]
      ),

    );
  }
}
