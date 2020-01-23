import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'components.dart';
import 'hotels.dart';

//in fact these data should be obtained from database
List<Hotel>restaurantNames = [kfc,dwarika,syanko,soltae,BurgerHouse];
List<String>restaurantDistance = ["1", "2", "3", "4", "5"];

class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<String> _signOut() async{
    await FirebaseAuth.instance.signOut();
    return "User has Successfully signed out";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.redAccent,
          ),
          elevation: 0.0,
          title: Row(children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "Pick to save time",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "poppins",
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              ),
            ),
          ]),
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                  hintText: "Search for item",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                )),
                Container(
                  height: 275,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemCardFood(
                          h1:restaurantNames[index].foodItems[index],
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey[100]),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.symmetric(horizontal: 9.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                              colors: [Colors.orangeAccent, Colors.pinkAccent]),
                        ),
                        child: Text(
                          "Discount",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "# Lets have food in Lowest price",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CategoriesList(),
                SizedBox(height: 15.0),
                Container(
                  height: 275,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemCard(
                            h1: restaurantNames[index],
                            distanceToDisplay:restaurantDistance[index],
                        );

                      }),
                ),
              ],
            ))));
  }
}
