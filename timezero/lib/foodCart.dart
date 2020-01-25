import 'package:flutter/material.dart';
import 'database.dart';
import 'package:flutter/cupertino.dart';

class FoodCart extends StatefulWidget {
  List<Items> foodCart;

  FoodCart();
  FoodCart.add({this.foodCart});

  @override
  _FoodCartState createState() => _FoodCartState();
}

class _FoodCartState extends State<FoodCart> {

  deleteAll() {
    setState(() {
      foodCartData.clear();
    });
  }

  Widget cartItem(int index) {
    return GestureDetector(
      onTap: () {},
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
              fontFamily: 'IndieFlower',
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
            "your cart is empty",
            style: TextStyle(
                fontSize: 30, color: Colors.grey, fontFamily: "openSans"),
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
              fontFamily: 'openSans',
            ),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.redAccent,
          ),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {},

                child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: foodCartData.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              key: Key(foodCartData[index].itemName),

                              onDismissed: (direction) {
                                setState(() {
                                  foodCartData.removeAt(index);
                                });
                              },
                              child: cartItem(index));

                        })),
              ),
            ),
            InkWell(
              onTap: () {

                showDialog(
                    context: context,
                    builder: (context) {
                      return SettingUp(callBackFunction: deleteAll);
                    });

              },
              child: Container(
                width: 200,
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

                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),

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
            SizedBox(height: 10),

          ],
        ),
      );
    }
  }
}

class SettingUp extends StatefulWidget {
  final _callback;
  SettingUp({@required callBackFunction}) : _callback = callBackFunction;
  @override
  _SettingUpState createState() => _SettingUpState();
}

class _SettingUpState extends State<SettingUp> {
  Duration timeSet;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(20),
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
            child: CupertinoTimerPicker(
              backgroundColor: Colors.orangeAccent,
              minuteInterval: 1,
              secondInterval: 1,
              initialTimerDuration: Duration(hours: 0, minutes: 0, seconds: 0),
              mode: CupertinoTimerPickerMode.hms,
              onTimerDurationChanged: (value) {
                print("here am i waiting");
                timeSet = value;
                print(value);
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(
                elevation: 5.0,
                onPressed: () {
                  if(timeSet!=null) {
                    for (var _item in foodCartData) {
                      bookedDetails.add(BookedDetails(
                        item: _item,
                        hotel: Hotel(
                            name: "Soltae",
                            rating: 5,
                            image: "images/soltae.jpg",
                            foodItems: foodsSoltae),
                        orderedTime: DateTime.now(),
                        durationSelected: timeSet,
                        stopwatch: Stopwatch()
                          ..start(),
                      ));
                    }
                    widget?._callback();
                    Navigator.pop(context);
                  }
                },
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                child: Text("Confirm Arrival Time",
                    style: TextStyle(
                      color:Colors.amber,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ))),
          ),
        )
      ],
    );
  }
}

