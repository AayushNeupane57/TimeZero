import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'components.dart';
import 'database.dart';
import 'restaurant.dart';
//in fact these data should be obtained from database
List<Hotel>restaurantNames = [kfc,dwarika,syanko,soltae,BurgerHouse];
List<String>restaurantDistance = ["1", "2", "3", "4", "5"];

class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //tap helps us when we so search item when tapped on the text field and
  //aslo help to override the pop method or bak button
  bool tap=false;
  String _searchText;
  List names;
  List filteredNames;
  TextEditingController _filter;
  _HomeState() {
    _searchText = "";
    names = List();
    filteredNames = List();
    _filter = TextEditingController();
  }


  @override
  void initState() {
    //
    super.initState();
    _getNames();
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        _searchText = "";
        filteredNames = names;
      } else {
        _searchText = _filter.text;
      }
      setState(() {});
    });
  }

  Future<String> _signOut() async{
    await FirebaseAuth.instance.signOut();
    return "User has Successfully signed out";
  }

  @override
  Widget build(BuildContext context) {
    return
//      WillPopScope(
//      onWillPop: ()async{setState(() {
//        tap=false;
//
//      }); return false;},
//      child:
      Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: Colors.white,
                centerTitle: true,
                title: TextField(
                  onTap: (){setState(() {
                    tap=true;

                  });
                  },
                  controller: _filter,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText:"search here",
                  ),
                ),
                actions: [
                  Icon(Icons.search),
                ]),
          ),
          body:Container(
               child: tap?_buildList():_buildHome(),
      )
      );
  }

  Widget _buildHome()
  {
    return  Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
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
            )));
  }

  Widget _buildList() {
    if (_searchText.isNotEmpty) {
      List tempList = List();
      for (int i = 0; i < filteredNames.length; i++) {

        //main logic behind search
        if (filteredNames[i].itemName
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return _searchCard(index);
      },
    );
  }

  void _getNames() async {
    //
    List tempList = foodsBurgerHouse;
    names = tempList;
    names.shuffle();
    filteredNames = names;
    setState(() {});
  }

  Widget _searchCard(int index) {
    return GestureDetector(
      onTap: ()  {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowItemDetail(foodItem: filteredNames[index]),
            ));
      },
      child: Container(
        //provides the gap between container and rest surrounding element
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,

//            boxShadow: [
//              BoxShadow(
//                blurRadius: 5,
//                offset: Offset(0, 3),
//                color: Colors.grey,
//              )
          ),
          padding: EdgeInsets.all(15.0),
          //margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex:3,
                    child: ClipOval(
                      child: Image.asset(filteredNames[index].itemImage),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text(
                          //notifications is a map and .keys properties of it returns an iterable which
                          //need to be converterd to the string to print
                          filteredNames[index].itemName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),

                        SizedBox(height:20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: <Widget>[
                              Text("Destination",style:
                              TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  height: 1.2),),

                              Text("hotelname",style:
                              TextStyle(
                                  color: Color(0XFFf5a623),
                                  fontSize: 17.0,
                                  height: 1.2),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ],
          )),
    );
  }

}
