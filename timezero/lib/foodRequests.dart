import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FoodRequest extends StatefulWidget {
  @override
  _FoodRequestState createState() => _FoodRequestState();
}

class _FoodRequestState extends State<FoodRequest> {
  String icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child:StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('BookedDetails').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('Loading...');
              return Container(
                child: new ListView(
                  children: snapshot.data.documents.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: new Text(document.data["itemName"].toString()),
                      subtitle: Container(

                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 3),
                color: Colors.grey,
              )]
              ),
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Text("ordered Time : "+DateFormat.yMd().add_jm().format(document.data["orderedTime"].toDate().toLocal())),
                            SizedBox(width: 30,),
                            Text("arrival  : "+DateFormat.yMd().add_jm().format(document.data["comingTime"].toDate().toLocal())),
                            Text(document.data["userName"].toString()),
                            Text(document.data["email"].toString()),
                            // Text("food item : " + document.data["itemName"].toString()),

                            Row(
                              children: <Widget>[
                                Column(
                                    children:<Widget>[
                                      IconButton(
                                        icon: Icon(Icons.help,
                                          color: Colors.green,),
                                        onPressed: () {


                                        },
                                      ),
                                      GestureDetector(
                                          child:
                                          Text("Accept Request",
                                              style: TextStyle(
                                                  fontSize: 14)),
                                          onTap:(){
                                            print("Accept button  pressed");

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
                                          setState(() {

                                          });
                                          print("Cancel button  pressed");
                                        },
                                      ),
                                      Text("Cancel Request",
                                          style: TextStyle(
                                              fontSize: 14)),

                                    ]
                                ),


                              ],
                            ),


                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),

        ),
      ),
    );
  }
}
