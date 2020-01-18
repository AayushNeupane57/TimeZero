import 'package:flutter/material.dart';


class Ordering extends StatefulWidget {


  @override
  _Ordering createState() =>_Ordering();
}


class _Ordering extends State<Ordering> {

  List<String> visitedHotels = ["KFC", "KKFC", "CFC", "Bota", "Burger house"];
  List<String>  dateVisited =["2014-04-02", "2016-12-14" ]; // need to convert the string into date.


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "aa",),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
      ),
    );


}
