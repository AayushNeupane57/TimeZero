
//this file contains three classes that are
/* RestaurantPage ShowDetail and ShowL istOfFood */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';
import 'database.dart';

class RestaurantPage extends StatelessWidget {
  Hotel hotel;
  final String distanceOfRestaurant;


  RestaurantPage({this.hotel,this.distanceOfRestaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(hotel.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RoundButton(icon: Icons.arrow_back_ios, onTap: (){Navigator.pop(context);},),
                      Spacer(),
                      RoundButton(icon: Icons.favorite_border),
                      SizedBox(width: 5.0),
                      RoundButton(icon: Icons.ac_unit),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.pin_drop,
                            color: Colors.grey[400],
                          ),
                          Text(
                            distanceOfRestaurant+"km",
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        hotel.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.orange),
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Text(
                            hotel.rating.toString(),
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DisplayRating(
                            rating: 5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),

                      Container(
                        margin:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 21),
                        padding: EdgeInsets.all(15),
                        color: Color(0xfff7f8fc),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: ClipRRect(
                                child: Image.asset('images/Momo.jpg'),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: ClipRRect(
                                child: Image.asset('images/mango.jpg'),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: ClipRRect(
                                child: Image.asset('images/apple.jpg'),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            )
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowListOfFoods( foodItems: hotel.foodItems),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.orangeAccent, Colors.pinkAccent],
                              ),
                              boxShadow: [
                                BoxShadow(blurRadius: 5.0, color: Colors.orange)
                              ]),
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "Show foods",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold, fontSize: 21),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.orange],
                              ),
                              boxShadow: [
                                BoxShadow(blurRadius: 5.0, color: Colors.orange)
                              ]),
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "Call this restaurant",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold, fontSize: 21),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowItemDetail extends StatelessWidget {
  Items foodItem;
  ShowItemDetail({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      this Builder is used for snackbar display
      When the Scaffold is actually created in the same build function, the context argument to the build function can't be used to find the
      Scaffold (since it's "above" the widget being returned). In such cases,
       the following technique with a Builder can be used to provide a new scope with a BuildContext that is "under" the Scaffold:*/

      body: Builder(
        builder: (BuildContext context){
        return SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(foodItem.itemImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        RoundButton(icon: Icons.arrow_back_ios, onTap: (){Navigator.pop(context);},),
                        Spacer(),
                        RoundButton(icon: Icons.favorite_border),
                        SizedBox(width: 5.0),
                        RoundButton(icon: Icons.ac_unit),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(25),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        foodItem.itemName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),

                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('images/profile.png'),
                          ),
                          SizedBox(width: 11),
                          Text(
                            "Username",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 21),
                          Text(
                            "22:30",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          Spacer(),
                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "59",
                            style: TextStyle(color: Colors.pink),
                          ),
                          SizedBox(width: 11),
                          Icon(
                            Icons.comment,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "129",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.all(30),
                        width: MediaQuery.of(context).size.width / 1.5,
                        height:50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color:Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Price=" + foodItem.itemPrice,
                            style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                fontSize:30,
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {

                                foodCartData.add(foodItem);
                                final snackBar = SnackBar(content: Text('Item added to cart sucessfully'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [Colors.yellow, Colors.orange],
                                    ),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 5.0, color: Colors.orange)
                                    ]),
                                child: Row(
                                  children: <Widget>[
                                    Spacer(),
                                    Text(
                                      "Add to Cart",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                foodCartData.add(foodItem);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(

                                      builder: (context) => OrderScreen(price:foodItem.itemPrice,image:foodItem.itemImage,itemName:foodItem.itemName,),
                                    ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [Colors.yellow, Colors.orange],
                                    ),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 5.0, color: Colors.orange)
                                    ]),
                                child: Row(
                                  children: <Widget>[
                                    Spacer(),
                                    Text(
                                      "Direct Oder",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
      ),
    );
  }
}


class ShowListOfFoods extends StatelessWidget {
  final List <Items> foodItems;

  ShowListOfFoods({this.foodItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Available Foods",
            style: TextStyle(
              color: Colors.black,

            ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.redAccent,
        ),


      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(foodItems.length, (index) {
          return ItemCardFood(
                     h1: foodItems[index],
                      );
        }),

    ));
  }
}





