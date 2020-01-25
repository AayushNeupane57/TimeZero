import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: Firestore.instance.collection("foodTestData").snapshots(),
              builder: (context,snapshot){
              return RaisedButton(
                onPressed: (){
                  DocumentSnapshot document = snapshot.data.documents[0];
                  document.reference.setData({
                    'itemName':"Sandwich.jpg",
                     'itemImage':"sandwich.jpg",
                     'itemPrice' :150,
                     'associatedHotel':"Hotel Object",

                  });
                },
                child: Text(
                  snapshot.data.documents.length.toString(),

              ),

              );
    },

          ),
      ),
    ));
  }
}
