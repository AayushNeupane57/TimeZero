import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FoodRequest extends StatefulWidget {
  @override
  _FoodRequestState createState() => _FoodRequestState();
}

class _FoodRequestState extends State<FoodRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
         child:StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('BookedDetails').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return new Text('Loading...');
                return new ListView(
                  children: snapshot.data.documents.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: new Text(document.data["itemName"]),
                      subtitle: Column(
                        children: <Widget>[
                          Text("ordered Time : "+DateFormat.yMd().add_jm().format(document.data["orderedTime"].toDate().toLocal())),
                          SizedBox(width: 30,),
                          Text("arrival  : "+DateFormat.yMd().add_jm().format(document.data["comingTime"].toDate().toLocal())),
                          Text(document.data["userName"].toString()),
                          Text(document.data["email"].toString()),
                         // Text("food item : " + document.data["itemName"].toString()),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
        ),
      ),
    );
  }
}


