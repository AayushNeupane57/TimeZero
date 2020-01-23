import 'package:flutter/material.dart';
import 'auth.dart';
import 'loginscreen.dart';
import'dart:math';
import'constants.dart';
class Profile extends StatelessWidget {
  final List <int> a = [10, 20, 30, 40];
  static final List<String> foodImages = [
    "assets/burger.jpg",
    "assets/momo.jpg",
    "assets/pizza.jpg",
    "assets/chilly.jpg",
    "assets/katiroll.jpg",
    "assets/meat.jpg",
    "assets/pizza2.jpg",
    "assets/sausage.jpg",
  ];
  Auth auth = new Auth();
  static var random = Random.secure();

  var index = random.nextInt(foodImages.length);
  String userName = "UserName";
  String phoNo = "+97798XXXXXXXX";
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
                child: Image.asset("images/profileBg.jpg",
                  height :400,fit: BoxFit.cover,),
              ),
              SingleChildScrollView(
                  child: Container(
                      constraints: BoxConstraints(minHeight: MediaQuery
                          .of(context)
                          .size
                          .height),
                      color: Color(0xfffdd0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
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
                                              'assets/anonym.png',
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
                                                          .black,
                                                      fontSize: 30,
                                                      fontWeight: FontWeight
                                                          .w700),),

                                                Text(phoNo,
                                                  style: TextStyle(
                                                      color: Colors
                                                          .black,
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [Colors.orangeAccent, Colors
                                          .pinkAccent
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 5.0, color: Colors
                                          .orange)
                                    ]),
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
                                                  Text(visitedRestaurant
                                                      .toString(), style:
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
                                                  Text(
                                                      waiting.toString(), style:
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
                                                  Text(("Rs." +
                                                      bonusPoint.toString()),
                                                      style:
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
                                  height: 300,

                                  padding: EdgeInsets.all(32),
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 20.0,
                                        // has the effect of softening the shadow
                                        spreadRadius: 5.0,
                                        // has the effect of extending the shadow
                                        offset: Offset(
                                          10.0, // horizontal, move right 10
                                          10.0, // vertical, move down 10
                                        ),
                                      )
                                    ],

                                  ),

                                  child: SingleChildScrollView(
                                      child: Column(
                                          children: <Widget>[


                                            Card(
                                                elevation: 10,
                                                //                           <-- Card widget
                                                child: ListTile(
                                                  leading: Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.black,
                                                      size: 30),
                                                  title: Text(
                                                    'My Bookings',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 20,
                                                    ),),
                                                  trailing: Icon(
                                                      Icons.expand_more),
                                                )),
                                            SizedBox(height: 25),
                                            Card(
                                                elevation: 10,
                                                //                           <-- Card widget
                                                child: ListTile(
                                                  leading: Icon(Icons.add,
                                                      color: Colors.black,
                                                      size: 30),
                                                  title: Text(
                                                    'Invite & earn',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 20,
                                                    ),),
                                                  trailing: Icon(
                                                      Icons.expand_more),
                                                )),
                                            SizedBox(height: 25),
                                            Card(
                                                elevation: 10,
                                                //                           <-- Card widget
                                                child: ListTile(
                                                  leading: Icon(Icons.settings,
                                                      color: Colors.black,
                                                      size: 30),
                                                  title: Text(
                                                    'Settings',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 20,
                                                    ),),
                                                  trailing: Icon(
                                                      Icons.expand_more),
                                                )),
                                            SizedBox(height: 25),
                                            Card(
                                                elevation: 10,
                                                //                           <-- Card widget
                                                child: ListTile(
                                                  leading: Icon(Icons.info,
                                                      color: Colors.black,
                                                      size: 30),
                                                  title: Text(
                                                    'About Us',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 20,
                                                    ),),
                                                  trailing: Icon(
                                                      Icons.expand_more),
                                                )),
                                            SizedBox(height: 25),
                                            Card(
                                                elevation: 10,
                                                //                           <-- Card widget
                                                child: ListTile(
                                                  leading: Icon(Icons.help,
                                                      color: Colors.black,
                                                      size: 30),
                                                  title: Text(
                                                    'Help & support',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 20,
                                                    ),),
                                                  trailing: Icon(
                                                      Icons.expand_more),
                                                )),
                                            SizedBox(height: 25),
                                            Card(
                                                elevation: 10,
                                                //
                                                //                         <-- Card widget
                                                child: ListTile(
                                                  leading: Icon(
                                                      Icons.exit_to_app,
                                                      color: Colors.black,
                                                      size: 30),
                                                  title: GestureDetector(
                                                    onTap: () async {
                                                      auth.signOut();
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder: (
                                                                  context) =>
                                                                  SignInUP(
                                                                      mainText: "Sign In",
                                                                      isSignIn: true)));
                                                    },
                                                    child: Text(
                                                      'Log out',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 20,
                                                      ),),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.expand_more),
                                                )),


                                          ])
                                  )
                              ),


                              Container(
                                margin: const EdgeInsets.only(top:10.0),
                                child: Row(
                                    children: <Widget>[
                                      Icon(Icons.copyright,
                                          color: Colors.black,
                                          size: 15),
                                      Text(
                                          '   All right reserved. 2020',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)
                                      )

                                    ]


                                ),

                              )

                            ]
                        ),
                      )

                  )
              )
            ]
        )
    );
  }
}
