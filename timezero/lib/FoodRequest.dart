//import "package:flutter/material.dart";
//import 'database.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'counter.dart';
//import 'map.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:intl/intl.dart';
//
//
//class FoodRequest extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _FoodRequest();
//  }
//}
//
//class _FoodRequest extends State<FoodRequest> {
//
//  @override
//  Widget build(BuildContext context) {
//    return
//      StreamBuilder(
//          stream: Firestore.instance.collection("Soltae").snapshots(),
//          builder: (BuildContext context, AsyncSnapshot snapshot) {
//            switch (snapshot.connectionState) {
//              case ConnectionState.none:
//              case ConnectionState.waiting:
//                return Center(
//                    child: CircularProgressIndicator());
//              default:
//                return
//                  Scaffold(
//                    backgroundColor: Colors.grey[100],
//                    appBar: AppBar(
//                      backgroundColor: Colors.redAccent,
//                      centerTitle: true,
//                      title: const Text('Food Request'),),
//                    body:(snapshot.data.document.length == 0) ? Container(
//                      child: Center(
//                        child: Text("No any Request", style: TextStyle(
//                            fontSize: 30, color: Colors.grey, fontFamily: "openSans"),
//                        ),
//                      ),
//                    )
//                        :
//                    Container(
//                        padding: EdgeInsets.all(10),
//                        child: ListView.builder(
//                            itemCount: snapshot.data.document.length,
//                            scrollDirection: Axis.vertical,
//                            itemBuilder: (context, index) {
//                              return Container(
//                                //provides the gap between container and rest surrounding element
//                                  margin: EdgeInsets.all(10),
//                                  width: MediaQuery
//                                      .of(context)
//                                      .size
//                                      .width,
//                                  decoration: BoxDecoration(
//                                    color: Colors.white,
//                                  ),
//                                  padding: EdgeInsets.all(15.0),
//                                  //margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
//                                  child: Column(
//                                    children: <Widget>[
//                                      Row(
//                                        crossAxisAlignment: CrossAxisAlignment.start,
//                                        children: <Widget>[
//
//                                          SizedBox(
//                                            width: 10,
//                                          ),
//                                          Expanded(
//                                            flex: 2,
//                                            child: Column(
//                                              children: <Widget>[
//                                                Text("ordered Time : "+DateFormat.yMd().add_jm().format(snapshot.data.documents["orderedTime"].toDate().toLocal())),
//                                                SizedBox(width: 30,),
//                                                Text("arrival  : "+DateFormat.yMd().add_jm().format(snapshot.data.documents.data["comingTime"].toDate().toLocal())),
//                                                Text(snapshot.data.documents.data["userName"].toString()),
//                                                Text(snapshot.data.documents.data["email"].toString()),
//
//                                              ],
//                                            ),
//                                          ),
//
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Column(
//                                              children: <Widget>[
//                                                IconButton(
//                                                  icon: Icon(Icons.check,
//                                                    color: Colors.green,),
//                                                  onPressed: () {
//                                                    print("accepted");
//                                                  },
//                                                ),
//                                                GestureDetector(
//                                                    child:
//                                                    Text("Accept Request",
//                                                        style: TextStyle(
//                                                            fontSize: 14)),
//                                                    onTap: () {
//                                                      print("accept button  pressed");
//
//                                                    }
//                                                ),
//                                              ]
//                                          ),
//
//                                          Spacer(),
//
//                                          Column(
//                                              children: <Widget>[
//                                                IconButton(
//                                                  icon: Icon(Icons.cancel,
//                                                      color: Colors.red),
//                                                  onPressed: () {
//                                                    setState(() {
//                                                      snapshot.data.document.removeAt(index);
//                                                    });
//                                                    print("cancel button  pressed");
//                                                  },
//                                                ),
//                                                Text("Cancel Request",
//                                                    style: TextStyle(
//                                                        fontSize: 14)),
//
//                                              ]
//                                          ),
//
//
//                                        ],
//                                      ),
//
//                                    ],
//                                  ));
//                            })),
//                  );
//            }
//          }
//      );
//  }
//
//
//
//
//}
