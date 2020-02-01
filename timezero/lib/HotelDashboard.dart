import'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:timezero/FoodRequest.dart';
import 'package:timezero/foodRequests.dart';
import 'package:timezero/menulist.dart';
import 'notifications.dart';



class HotelDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HotelDashboard();
  }
}


class _HotelDashboard extends State<HotelDashboard> {
  Material myItems(IconData icon, String heading, int color) {
    return Material(
        color: Colors.white,
        elevation: 4.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(24.0),
        child: Center(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        //Text
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(heading,
                                style: TextStyle(
                                  color: Color(color),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,

                                )),
                          ),
                        ),

                        //Icon button;
                        Material(

                          color: Color(color),
                          borderRadius: BorderRadius.circular(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(icon,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),


                      ],
                    )
                  ],
                )
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: const Text('HotelDashbard'),),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 12.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: <Widget>[

              GestureDetector(
                  onTap: () {
                    print("Today's Business");
                  },
                  child: myItems(Icons.supervised_user_circle, "Today's business",
                      0xff3999fe)),

              GestureDetector(
                  onTap: () {

                    print("Notification");
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => Notification(),
//                        ));
                  },
                  child: myItems(Icons.notifications_active, "Notifications", 0xffff3266)),
              GestureDetector(
                  onTap: () {
                    print("Food request");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>FoodRequest(),
                        ));
                  },
                  child: myItems(Icons.fastfood, "Food Request", 0xffffa500)),
              GestureDetector(
                  onTap: () {
                    print("Menu list");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuList()),
                    );
                  },
                  child: myItems(Icons.restaurant_menu, "Menu List", 0xff1f9aa1)),
              GestureDetector(
                  onTap: () {
                    print("My profile");
                  },
                  child: myItems(Icons.person, "My Profile", 0xfff52abb)),
//        MyItems(Icons.notifications_active, "Notifications", 0xffff3266),


            ],

            staggeredTiles: [
              StaggeredTile.extent(3, 190),
              StaggeredTile.extent(1, 190),
              StaggeredTile.extent(1, 190),
              StaggeredTile.extent(1, 190),
              StaggeredTile.extent(1, 190),
            ],

          ),
        )
    );
  }
}
