
import "package:flutter/material.dart";
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';


class BookedDetails{
  String image;
  String name;
  DateTime orderDateTime; // time at which order is made
  DateTime finalDateTime; // time the customer is supposed to get the food served
  String address;
  String item;
  BookedDetails(this.image,this.name,this.orderDateTime,this.finalDateTime,this.address,this.item);
}
int count = 1;
List <BookedDetails> bookedDetails =
[BookedDetails("images/syanko.png","Syanko",DateTime.parse("2020-01-22 13:47:39.106637"), DateTime.parse("2020-01-22 14:11:39.106637"),"Thapathali","Burger"),];


class Order extends StatefulWidget{
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Order();
  }
}


class _Order extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                backgroundColor: Colors.redAccent,
                centerTitle: true,
                title: const Text('Orderings'),
                bottom: TabBar(

                    tabs: [
                      Tab(icon: Icon(Icons.timer),
                        text: "WAITING",),
                      Tab(icon: Icon(Icons.check_box),
                        text: "VISITED",),
                      Tab(icon: Icon(Icons.clear),
                        text: "CANCELLED",),
                    ]

                )
            ),
            body:
            TabBarView(
              children:[
                 SingleChildScrollView(

                   child: Column( // 1st tab
                     children: <Widget>[

                       SizedBox(height: 10),
                       Container(
                         decoration: BoxDecoration(
                             border: Border.all(color: Colors.blueAccent),
                           color: Colors.white,),

                           child: Column(
                             children: <Widget>[
                               Container(
                                 height:50,
                                 child: Row(
                                   children: <Widget>[
                                     Text("Kathmandu",
                                         style: TextStyle(
                                           fontSize: 12,
                                         )),
                                     Spacer(),

                                     Text((bookedDetails[0].finalDateTime.difference(DateTime.now())).toString(),

                                         style: TextStyle(
                                           fontSize: 12,
                                         )
                                     ),
                                     RaisedButton(

                                       onPressed: ()
                                       {
                                         setState(() {
                                           DateTime date = DateTime.now();
                                           String time = "${date.hour}:${date.minute}:${date.second}";
                                           print(DateTime.now());
                                           print(bookedDetails[0].finalDateTime);
                                           print(time);
                                         });
                                       },
                                       child: Text("see Remaining time "),)





                                   ],
                                 ),

                               ),
                               Container(
                                 height: 2,
                                 color: Colors.grey,
                               ),

                               SingleChildScrollView(
                                 scrollDirection: Axis.horizontal,

                                 child:
                                 Container(
                                     height:200,
                                     color: Colors.white,
                                     child:
                                     Row(
                                       children: <Widget>[
                                         ClipOval(
                                           child: Image.asset(
                                             'images/Momo.jpg',
                                             width: 200,
                                             fit: BoxFit.cover,),
                                         ),
                                         SizedBox(width:45),
                                         Column(
                                           children:<Widget>[
                                             Text(bookedDetails[0].name+", " ,
                                               style: TextStyle(
                                                 fontSize: 12,),),
                                             Text(bookedDetails[0].address,
                                               style: TextStyle(
                                                 fontSize: 12,),),

                                             Text("Ordered date/time"),
                                             Text("${bookedDetails[0].orderDateTime.year}/${bookedDetails[0].orderDateTime.month}/${bookedDetails[0].orderDateTime.day}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("${bookedDetails[0].orderDateTime.hour}:${bookedDetails[0].orderDateTime.minute}:${bookedDetails[0].orderDateTime.second}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("Final time:"),
                                             Text("${bookedDetails[0].finalDateTime.hour}:${bookedDetails[0].finalDateTime.minute}:${bookedDetails[0].finalDateTime.second}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("Ordered Items:",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text(bookedDetails[0].item,
                                                 style: TextStyle(
                                                   fontSize: 12,))
                                           ],


                                         ),




                                       ],
                                     )

                                 ),
                               ),



                               //container to colour the space
                               Container(
                                 height: 2,
                                 color: Colors.grey,
                               ),


                               Container(
                                   color: Colors.white,
                                   child: Row(
                                     children: <Widget>[
                                       Column(
                                           children:<Widget>[
                                             IconButton(
                                               icon: Icon(Icons.call,
                                                 color: Colors.green,),
                                               onPressed: () {
                                                 print("call buttonn  pressed");
                                                 launch("tel:+9779867353344");
                                               },
                                             ),
                                             GestureDetector(
                                                 child:
                                                 Text("Call Hotel",
                                                     style: TextStyle(
                                                         fontSize: 14)),
                                                 onTap:(){
                                                   print("CALL button  pressed");
                                                   launch("tel:+9779867353344");
                                                 }
                                             ),
                                           ]
                                       ),
                                       Spacer(),
                                       Column(
                                           children:<Widget>[
                                             IconButton(
                                               icon: Icon(Icons.cancel,
                                                   color:Colors.red),
                                               onPressed: () {
                                                 print("cancel button  pressed");
                                               },
                                             ),
                                             GestureDetector(
                                                 child:
                                                 Text("Cancel Order",
                                                     style: TextStyle(
                                                         fontSize: 14)),
                                                 onTap:(){
                                                   print("cancel button  pressed");
                                                 }
                                             ),

                                           ]
                                       ),


                                     ],
                                   )

                               )


                             ],
                           )
                       ),
                      Container(
                        height: 10,
                        color: Colors.grey[100],
                      ),
                       Container(
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.blueAccent),
                             color: Colors.white,),

                           child: Column(
                             children: <Widget>[
                               Container(
                                 height:50,
                                 child: Row(
                                   children: <Widget>[
                                     Text("Kathmandu",
                                         style: TextStyle(
                                           fontSize: 12,
                                         )),
                                     Spacer(),

                                     Text((bookedDetails[0].finalDateTime.difference(DateTime.now())).toString(),

                                         style: TextStyle(
                                           fontSize: 12,
                                         )
                                     ),
                                     RaisedButton(

                                       onPressed: ()
                                       {
                                         setState(() {
                                           DateTime date = DateTime.now();
                                           String time = "${date.hour}:${date.minute}:${date.second}";
                                           print(DateTime.now());
                                           print(bookedDetails[0].finalDateTime);
                                           print(time);
                                         });
                                       },
                                       child: Text("see Remaining time "),)





                                   ],
                                 ),

                               ),
                               Container(
                                 height: 2,
                                 color: Colors.grey,
                               ),

                               SingleChildScrollView(
                                 scrollDirection: Axis.horizontal,

                                 child:
                                 Container(
                                     height:200,
                                     color: Colors.white,
                                     child:
                                     Row(
                                       children: <Widget>[
                                         ClipOval(
                                           child: Image.asset(
                                             'images/Momo.jpg',
                                             width: 200,
                                             fit: BoxFit.cover,),
                                         ),
                                         SizedBox(width:45),
                                         Column(
                                           children:<Widget>[
                                             Text(bookedDetails[0].name+", " ,
                                               style: TextStyle(
                                                 fontSize: 12,),),
                                             Text(bookedDetails[0].address,
                                               style: TextStyle(
                                                 fontSize: 12,),),

                                             Text("Ordered date/time"),
                                             Text("${bookedDetails[0].orderDateTime.year}/${bookedDetails[0].orderDateTime.month}/${bookedDetails[0].orderDateTime.day}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("${bookedDetails[0].orderDateTime.hour}:${bookedDetails[0].orderDateTime.minute}:${bookedDetails[0].orderDateTime.second}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("Final time:"),
                                             Text("${bookedDetails[0].finalDateTime.hour}:${bookedDetails[0].finalDateTime.minute}:${bookedDetails[0].finalDateTime.second}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("Ordered Items:",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text(bookedDetails[0].item,
                                                 style: TextStyle(
                                                   fontSize: 12,))
                                           ],


                                         ),




                                       ],
                                     )

                                 ),
                               ),



                               //container to colour the space
                               Container(
                                 height: 2,
                                 color: Colors.grey,
                               ),


                               Container(
                                   color: Colors.white,
                                   child: Row(
                                     children: <Widget>[
                                       Column(
                                           children:<Widget>[
                                             IconButton(
                                               icon: Icon(Icons.call,
                                                 color: Colors.green,),
                                               onPressed: () {
                                                 print("call buttonn  pressed");
                                                 launch("tel:+9779867353344");
                                               },
                                             ),
                                             GestureDetector(
                                                 child:
                                                 Text("Call Hotel",
                                                     style: TextStyle(
                                                         fontSize: 14)),
                                                 onTap:(){
                                                   print("CALL button  pressed");
                                                   launch("tel:+9779867353344");
                                                 }
                                             ),
                                           ]
                                       ),
                                       Spacer(),
                                       Column(
                                           children:<Widget>[
                                             IconButton(
                                               icon: Icon(Icons.cancel,
                                                   color:Colors.red),
                                               onPressed: () {
                                                 print("cancel button  pressed");
                                               },
                                             ),
                                             GestureDetector(
                                                 child:
                                                 Text("Cancel Order",
                                                     style: TextStyle(
                                                         fontSize: 14)),
                                                 onTap:(){
                                                   print("cancel button  pressed");
                                                 }
                                             ),

                                           ]
                                       ),


                                     ],
                                   )

                               )


                             ],
                           )
                       ),
                       Container(
                         height: 10,
                         color: Colors.grey[100],
                       ),
                       Container(
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.blueAccent),
                             color: Colors.white,),

                           child: Column(
                             children: <Widget>[
                               Container(
                                 height:50,
                                 child: Row(
                                   children: <Widget>[
                                     Text("Kathmandu",
                                         style: TextStyle(
                                           fontSize: 12,
                                         )),
                                     Spacer(),

                                     Text((bookedDetails[0].finalDateTime.difference(DateTime.now())).toString(),

                                         style: TextStyle(
                                           fontSize: 12,
                                         )
                                     ),
                                     RaisedButton(

                                       onPressed: ()
                                       {
                                         setState(() {
                                           DateTime date = DateTime.now();
                                           String time = "${date.hour}:${date.minute}:${date.second}";
                                           print(DateTime.now());
                                           print(bookedDetails[0].finalDateTime);
                                           print(time);
                                         });
                                       },
                                       child: Text("see Remaining time "),)





                                   ],
                                 ),

                               ),
                               Container(
                                 height: 2,
                                 color: Colors.grey,
                               ),

                               SingleChildScrollView(
                                 scrollDirection: Axis.horizontal,

                                 child:
                                 Container(
                                     height:200,
                                     color: Colors.white,
                                     child:
                                     Row(
                                       children: <Widget>[
                                         ClipOval(
                                           child: Image.asset(
                                             'images/Momo.jpg',
                                             width: 200,
                                             fit: BoxFit.cover,),
                                         ),
                                         SizedBox(width:45),
                                         Column(
                                           children:<Widget>[
                                             Text(bookedDetails[0].name+", " ,
                                               style: TextStyle(
                                                 fontSize: 12,),),
                                             Text(bookedDetails[0].address,
                                               style: TextStyle(
                                                 fontSize: 12,),),

                                             Text("Ordered date/time"),
                                             Text("${bookedDetails[0].orderDateTime.year}/${bookedDetails[0].orderDateTime.month}/${bookedDetails[0].orderDateTime.day}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("${bookedDetails[0].orderDateTime.hour}:${bookedDetails[0].orderDateTime.minute}:${bookedDetails[0].orderDateTime.second}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("Final time:"),
                                             Text("${bookedDetails[0].finalDateTime.hour}:${bookedDetails[0].finalDateTime.minute}:${bookedDetails[0].finalDateTime.second}",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text("Ordered Items:",
                                                 style: TextStyle(
                                                   fontSize: 12,)),
                                             Text(bookedDetails[0].item,
                                                 style: TextStyle(
                                                   fontSize: 12,))
                                           ],


                                         ),




                                       ],
                                     )

                                 ),
                               ),



                               //container to colour the space
                               Container(
                                 height: 2,
                                 color: Colors.grey,
                               ),


                               Container(
                                   color: Colors.white,
                                   child: Row(
                                     children: <Widget>[
                                       Column(
                                           children:<Widget>[
                                             IconButton(
                                               icon: Icon(Icons.call,
                                                 color: Colors.green,),
                                               onPressed: () {
                                                 print("call buttonn  pressed");
                                                 launch("tel:+9779867353344");
                                               },
                                             ),
                                             GestureDetector(
                                                 child:
                                                 Text("Call Hotel",
                                                     style: TextStyle(
                                                         fontSize: 14)),
                                                 onTap:(){
                                                   print("CALL button  pressed");
                                                   launch("tel:+9779867353344");
                                                 }
                                             ),
                                           ]
                                       ),
                                       Spacer(),
                                       Column(
                                           children:<Widget>[
                                             IconButton(
                                               icon: Icon(Icons.cancel,
                                                   color:Colors.red),
                                               onPressed: () {
                                                 print("cancel button  pressed");
                                               },
                                             ),
                                             GestureDetector(
                                                 child:
                                                 Text("Cancel Order",
                                                     style: TextStyle(
                                                         fontSize: 14)),
                                                 onTap:(){
                                                   print("cancel button  pressed");
                                                 }
                                             ),

                                           ]
                                       ),


                                     ],
                                   )

                               )


                             ],
                           )
                       ),
                       Container(
                         height: 10,
                         color: Colors.grey[100],
                       ),


                     ],
                   ),

                 ),






                // 2nd tab
                Column(
                  children: <Widget>[
                    SizedBox(height: 0),
                    Container(
                        padding: EdgeInsets.all(32),
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                10.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            )
                          ],
                        ),
                        child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Kathmandu"),
                                  Text('count down here'),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  //  Image.asset(bookedImage[0]),
                                  //Text(bookedName[0]),
                                ],
                              )


                            ]
                        )


                    )
                  ],


                ),

                // 3rd tab
                Column(
                  children: <Widget>[
                    SizedBox(height: 0),
                    Container(
                        padding: EdgeInsets.all(32),
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                10.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            )
                          ],
                        ),
                        child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Kathmandu"),
                                  Text('count down here'),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  // Image.asset(bookedImage[0]),
                                  //Text(bookedName[0]),
                                ],
                              )


                            ]
                        )


                    )
                  ],


                )],

            )
        )
    );
  }
}

