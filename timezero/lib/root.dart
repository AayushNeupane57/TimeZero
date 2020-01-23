import 'package:flutter/material.dart';
import 'package:timezero/components.dart';
import 'package:timezero/notifications.dart';
import 'package:timezero/profile.dart';
import 'home.dart';
import 'hotels.dart';
import'Orderings.dart';
void main() {
  runApp(MaterialApp(
    // Title
      title: "Using Tabs",
      // Home
      home: MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 5, vsync: this,);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      // Set the TabBar view as the body of the Scaffold
      body: SafeArea(
        child: TabBarView(
          // Add tabs as widgets
          children: <Widget>[Home(), FoodCart.add(foodCart:foodCartData),Order(),NotiFication(),Profile()],
          // set the controller
          controller: controller,
        ),
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          indicatorColor: Colors.redAccent,
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.home,
              color: Colors.black,),
            ),
            Tab(
              icon: Icon(Icons.shopping_cart,
                color: Colors.black,),
            ),
            Tab(
              icon: Icon(Icons.timer,
                color: Colors.black,),
            ),
            Tab(
              icon: Icon(Icons.notifications_active,
                color: Colors.black,),
            ),
            Tab(
              icon: Icon(Icons.person,
                color: Colors.black,),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}