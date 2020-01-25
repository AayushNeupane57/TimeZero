import 'package:flutter/material.dart';
import 'package:timezero/database.dart';
import 'restaurant.dart';

List<String> catagories = ["All", "Popular", "Dessert", "Snack", "Fast Food"];

class ItemCard extends StatelessWidget {
  final Hotel h1;
  final String distanceToDisplay;

  ItemCard({this.h1, this.distanceToDisplay});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantPage(
                  hotel: h1, distanceOfRestaurant: distanceToDisplay),
            ));
      },
      child: Container(
        //provides the gap between container and rest surrounding element
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 3),
                color: Colors.grey,
              )
            ]),
        padding: EdgeInsets.all(15.0),
        //margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRect(
                child: Image.asset(h1.image),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              h1.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "poppins",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.pin_drop,
                  color: Colors.grey,
                ),
                Text(
                  distanceToDisplay + " km far",
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Flexible(
                  flex: 3,
                  child: DisplayRating(rating: h1.rating),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DisplayRating extends StatelessWidget {
  final int rating;
  DisplayRating({this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? Colors.orange : Colors.black,
          size: 10,
        );
      }),
    );
  }
}

class CatagoriesButton extends StatelessWidget {
  final bool active;
  final String title;
  final onTap;
  const CatagoriesButton({Key key, this.active, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 115,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: !active ? Border.all(color: Colors.grey[100]) : null,
            borderRadius: BorderRadius.circular(21.0),
            gradient: active
                ? LinearGradient(colors: [Colors.yellow, Colors.orange])
                : null,
            color: active ? null : Colors.white,
            boxShadow: [
              active
                  ? BoxShadow(
                color: Colors.yellow,
                offset: Offset(0, 3),
                blurRadius: 5.0,
              )
                  : BoxShadow()
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: ListView.builder(
        itemCount: catagories.length,
        itemBuilder: (BuildContext context, int id) {
          return CatagoriesButton(
            title: catagories[id],
            active: id == _active ? true : false,
            onTap: () {
              setState(() {
                _active = id;
              });
            },
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final onTap;
  const RoundButton({Key key, this.icon, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      padding: EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onTap,
      ),
      height: 50,
      width: 50,
    );
  }
}

class ItemCardFood extends StatelessWidget {
  final Items h1;

  ItemCardFood({this.h1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowItemDetail(foodItem: h1),
            ));
      },
      child: Container(
        //provides the gap between container and rest surrounding element
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 3),
                color: Colors.grey,
              )
            ]),
        padding: EdgeInsets.all(15.0),
        //margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRect(
                child: Image.asset(h1.itemImage),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              h1.itemName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final String price;
  final String image;
  final String itemName;

  OrderScreen({this.price, this.image, this.itemName});
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _counter = 0;
  int _time = 0;
  String str = "hours";

  void _incrementCounter() {
    setState(() {
      if (_counter < 50) {
        _counter++;
      } else {
        print("maximum limit crossed");
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter > 1 ? _counter-- : null;
    });
  }

  void _incrementTime() {
    setState(() {
      if (_time < 50) {
        _time++;
      } else {
        print("maximum limit crossed");
      }
    });
  }

  void _decrementTime() {
    setState(() {
      _time > 1 ? _time-- : _time + 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RoundButton(
                        icon: Icons.arrow_back_ios,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
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
                    Row(
                      children: <Widget>[
                        Text(
                          widget.itemName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.timer),
                          onPressed: () {
                            if (str == "hours") {
                              setState(() {
                                str = "min  ";
                              });
                            } else {
                              setState(() {
                                str = "hours";
                              });
                            }
                          },
                        ),
                        Text(
                          str,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              onPressed: () {
                                _incrementCounter();
                              },
                              child: Text(
                                "increase",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Items :  $_counter',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)),
                              onPressed: () {
                                _decrementCounter();
                              },
                              child: Text(
                                "Decrease",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              onPressed: () {
                                _incrementTime();
                              },
                              child: Text(
                                "increase",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Time :  $_time',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)),
                              onPressed: () {
                                _decrementTime();
                              },
                              child: Text(
                                "Decrease",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
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
                              "Confirm Order",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21),
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
          ],
        ),
      ),
    );
  }
}

class FoodCart extends StatefulWidget {
  List<Items> foodCart;
  FoodCart();
  //this .add is a nave i gave it  to for a sake of fuctionality like overloaded constructor
  FoodCart.add({this.foodCart});

  @override
  _FoodCartState createState() => _FoodCartState();
}

class _FoodCartState extends State<FoodCart> {
  Widget cartItem(int index) {
    return GestureDetector(
      onTap: () {
        print("<<<<<<<<<<<");
        bookedDetails.add(BookedDetails(
          item: foodCartData[index],
          hotel: Hotel(
              name: "Soltae",
              rating: 5,
              image: "images/soltae.jpg",
              foodItems: foodsSoltae),
          orderedTime: DateTime.now(),
          durationSelected: Duration(hours: 1),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: ClipOval(
                child: Image.asset("images/cart.jpg"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                Text(
                  //notifications is a map and .keys properties of it returns an iterable which
                  //need to be converterd to the string to print
                  widget.foodCart[index].itemName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Some related information here",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontFamily: "poppins",
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print(widget.foodCart.length);

                print("inside the set state function");
                widget.foodCart.removeAt(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.foodCart.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Cart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.redAccent,
          ),
          elevation: 0.0,
        ),
        body: Center(
          child: Text(
            "Your Cart is Empty",
            style: TextStyle(fontSize: 30),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Cart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.redAccent,
          ),
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: foodCartData.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return cartItem(index);
                })),
      );
    }
  }
}
