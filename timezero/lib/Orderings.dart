
import "package:flutter/material.dart";
import 'package:timezero/home.dart';
import 'database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'counter.dart';
import 'testpage.dart';
import 'map.dart';



class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  return _Order();
  }
}

class _Order extends State<Order> {
  List<BookedDetails> _bookedItems = bookedDetails;

  Widget _waitingTab()
  {
    return (_bookedItems.length==0 ) ? Container(
      child:Center(
        child: Text("No any pending orders", style: TextStyle(fontSize: 30,color: Colors.grey,fontFamily: "openSans"),
        ),
      ),
    )
    :
    Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: _bookedItems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return OrderedItemCard(index);
            }));
  }

  Widget OrderedItemCard(int index) {
    return Container(
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
                    child: Image.asset(_bookedItems[index].item.itemImage),
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
                        _bookedItems[index].item.itemName,
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
                            Text(
                              "Time remaining",
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontFamily: "poppins",
                                color: Colors.black38,
                              ),
                            ),
                            Container(
                              width: 60.0,
                              padding: EdgeInsets.only(top: 3.0, right: 4.0),
                              child: CountDownTimer(
                                secondsRemaining: (_bookedItems[index].durationSelected- _bookedItems[index].stopwatch.elapsed).inSeconds,
                                whenTimeExpires: () {
                                  //hasStoppedTimer(true)
                                },
                                countDownTimerStyle: TextStyle(
                                    color: Color(0XFFf5a623),
                                    fontSize: 14.0,

                                    height: 1.2),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("Destination",style:
                            TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                height: 1.2),),

                            Text(_bookedItems[index].hotel.name,style:
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
            Row(
              children: <Widget>[
                Column(
                    children:<Widget>[
                      IconButton(
                        icon: Icon(Icons.call,
                          color: Colors.green,),
                        onPressed: () {
                          launch("tel:+9779867353344");
                        },
                      ),
                      GestureDetector(
                          child:
                          Text("Call Hotel",
                              style: TextStyle(
                                  fontSize: 14)),
                          onTap:(){
                            print("CALL button  pressed");
                            launch("tel:+9779867353344");
                          }
                      ),
                    ]
                ),
                Spacer(),

                Map(_bookedItems[index].hotel.position),
                Spacer(),

                Column(
                    children:<Widget>[
                      IconButton(
                        icon: Icon(Icons.cancel,
                            color:Colors.red),
                        onPressed: () {
                          setState(() {
                            _bookedItems.removeAt(index);
                          });
                          print("cancel button  pressed");
                        },
                      ),
                      Text("Cancel Order",
                          style: TextStyle(
                              fontSize: 14)),

                    ]
                ),


              ],
            ),

    ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                backgroundColor: Colors.redAccent,
                centerTitle: true,
                title: const Text('Orderings'),
                bottom: TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.timer),
                    text: "WAITING",
                  ),
                  Tab(

                    text: "Testing",

                  ),
                  Tab(
                    icon: Icon(Icons.clear),
                    text: "CANCELLED",
                  ),
                ])),
            body: TabBarView(children: [

              _waitingTab(),
              TestPage(),


              TestPage(),

//              SingleChildScrollView(
//                  child: Column(// 1st tab
//                      children: <Widget>[
//                SizedBox(height: 10),
//                Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.blueAccent),
//                      color: Colors.white,
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Column(
//                        children: <Widget>[
//                          Container(
//                            height: 50,
//                            child: Row(
//                              children: <Widget>[
//                                Text("Kathmandu",
//                                    style: TextStyle(
//                                      fontSize: 12,
//                                    )),
//                                Spacer(),
//                                Text(
//                                    (bookedDetails[0]
//                                            .finalDateTime
//                                            .difference(DateTime.now()))
//                                        .inSeconds
//                                        .toString(),
//                                    style: TextStyle(
//                                      fontSize: 12,
//                                    )),
//                                SizedBox(
//                                  width: 20,
//                                ),
//                                RaisedButton(
//                                  onPressed: () {
//                                    setState(() {
//                                      DateTime date = DateTime.now();
//                                      String time =
//                                          "${date.hour}:${date.minute}:${date.second}";
//                                      print(DateTime.now());
//                                      print(bookedDetails[0].finalDateTime);
//                                      print(time);
//                                    });
//                                  },
//                                  child: Text("Time left "),
//                                )
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ))
//              ])),
//              SingleChildScrollView(
//                  child: Column(// 1st tab
//                      children: <Widget>[
//                SizedBox(height: 10),
//                Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.blueAccent),
//                      color: Colors.white,
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Column(
//                        children: <Widget>[
//                          Container(
//                            height: 50,
//                            child: Row(
//                              children: <Widget>[
//                                Text("Kathmandu",
//                                    style: TextStyle(
//                                      fontSize: 12,
//                                    )),
//                                Spacer(),
//                                Text(
//                                    (bookedDetails[0]
//                                            .finalDateTime
//                                            .difference(DateTime.now()))
//                                        .inSeconds
//                                        .toString(),
//                                    style: TextStyle(
//                                      fontSize: 12,
//                                    )),
//                                SizedBox(
//                                  width: 20,
//                                ),
//                                RaisedButton(
//                                  onPressed: () {
//                                    setState(() {
//                                      DateTime date = DateTime.now();
//                                      String time =
//                                          "${date.hour}:${date.minute}:${date.second}";
//                                      print(DateTime.now());
//                                      print(bookedDetails[0].finalDateTime);
//                                      print(time);
//                                    });
//                                  },
//                                  child: Text("Time left "),
//                                )
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ))
//              ]))
            ])));
  }
}

