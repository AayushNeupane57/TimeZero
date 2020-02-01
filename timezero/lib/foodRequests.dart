import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:timezero/data.dart';

class FoodRequest extends StatefulWidget {
  @override
  _FoodRequestState createState() => _FoodRequestState();
}

class _FoodRequestState extends State<FoodRequest> {
  var icon = Icons.help;
  String acceptText ="Accept Request ?";
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child:StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('BookedDetails').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('Loading...');
              return
                ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return new ListTile(
                        title: new Text(snapshot.data
                            .documents[index]["itemName"].toString()),
                        subtitle: Container(

                          margin: EdgeInsets.all(10),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                  color: Colors.grey,
                                )
                              ]
                          ),
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Text("ordered Time : "
//                                  DateFormat.yMd().add_jm().format(snapshot.data
//                                      .documents[index]["orderedTime"]
//                                      .toDate()
//                                      .toLocal())
                              ),
                              SizedBox(width: 30,),
                              Text("arrival  : "
//                                  DateFormat.yMd().add_jm().format(snapshot.data
//                                      .documents[index]["comingTime"]
//                                      .toDate()
//                                      .toLocal())
                              ),
                              Text(snapshot.data.documents[index]["userName"]
                                  .toString()),
                              Text(snapshot.data.documents[index]["email"]
                                  .toString()),
                              // Text("food item : " + document.data["itemName"].toString()),

                              Row(
                                children: <Widget>[
                                  Column(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(icon,
                                            color: Colors.green,),
                                          onPressed: () {
                                            setState(() {
                                              icon = Icons.check_box;
                                              acceptText ="Accepted";
                                              updatebookedDetails(snapshot.data.documents[index].documentID);
                                              accepted = true;


                                            });




                                          },
                                        ),
                                        GestureDetector(
                                            child:
                                            Text(acceptText,
                                                style: TextStyle(
                                                    fontSize: 14)),
                                            onTap: () {
                                              setState(() {
                                                icon = Icons.check_box;
                                                acceptText ="Accepted";
                                                accepted = true;
                                              });
                                            }
                                        ),
                                      ]
                                  ),


                                  Spacer(),

                                  Column(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.cancel,
                                              color: Colors.red),
                                          onPressed: () {
                                            setState(() {
                                              Firestore.instance.collection(
                                                  "BookedDetails").document(
                                                  snapshot.data.documents[index]
                                                      .documentID)
                                                  .delete();
                                              print(index);
                                            });

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
                    });
            }
            )

          ),

        ),
      );

  }
}
