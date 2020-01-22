import 'dart:ui';
import "package:flutter/material.dart";
import 'components.dart';
import 'profile.dart';
import 'Orderings.dart';

List<String>restaurantNames = ["KFC", "BurgerHouse", "CFC", "Annapurna", "Solti Crown"];
List<String>restaurantDistance = ["1", "2", "3", "4", "5"];
List<String>restaurantRating = ["5", "4", "3", "4", "5"];
List<String> restaurantImages =[
  "images/sandwich.jpg",
  "images/Momo.jpg",
  "images/apple.jpg",
  "images/banana.jpg",
  "images/mango.jpg",
];


List<String>foodNames = ["Sandwich", "MOMO", "apple", "banana", "Mango"];
List<String>foodDistance = ["1", "2", "3", "4", "5"];
List<String>foodRating = ["5", "4", "3", "4", "5"];

List<String> foodImages =[
  "images/sandwich.jpg",
  "images/Momo.jpg",
  "images/apple.jpg",
  "images/banana.jpg",
  "images/mango.jpg",
];


class Home2 extends StatelessWidget {
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
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.restaurant),
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Order()),
                );

                },
              ),
              IconButton(
                icon: Icon(Icons.av_timer),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );

                },
              ),
            ],
          ),
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
                        return ItemCard(
                          nameToDisplay: foodNames[index],
                          imagesToDisplay:foodImages [index],
                          distanceToDisplay:foodDistance[index],
                          ratingToDisplay: foodRating[index],
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
                            nameToDisplay: restaurantNames[index],
                            imagesToDisplay:restaurantImages [index],
                            distanceToDisplay:restaurantDistance[index],
                            ratingToDisplay:restaurantRating[index] ,
                        );
                      }),
                ),
              ],
            ))));
  }
}
