
import "package:flutter/material.dart";


class BookedDetails{
  String image;
  String name;
  String date;
  String wTime;
  String oTime;
  String address;
  BookedDetails(this.image,this.name,this.date,this.wTime,this.oTime,this.address);
}
int count = 1;
List <BookedDetails> bookedDetails =
[BookedDetails("images/syanko.png","Syanko","2019/04/16","00:20:00", "01:02:30","Thapathali"),];




Widget bookedItems()
{
if (count == bookedDetails.length)
  {return Container(

          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height:50,
                child: Row(
                  children: <Widget>[
                    Text("Kathmandu",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    Spacer(),
                    Text('count down',),

                  ],
                ),

              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              Container(
                  height:150,
                  color: Colors.white,
                  child:
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          'images/Momo.jpg',
                          fit: BoxFit.cover,),
                      ),
                      SizedBox(width:50),
                      Column(
                        children:<Widget>[
                          Text(bookedDetails[0].name+", " ,
                            style: TextStyle(
                              fontSize: 18,),),
                          Text(bookedDetails[0].address,
                            style: TextStyle(
                              fontSize: 18,),),

                          Text("Ordering date/time"),
                          Text(bookedDetails[0].date,
                              style: TextStyle(
                                fontSize: 18,)),
                          Text(bookedDetails[0].oTime,
                              style: TextStyle(
                                fontSize: 18,))
                        ],


                      ),




                    ],
                  )

              ),


              //container to colour the space
              Container(
                height: 2,
                color: Colors.grey,
              ),


              Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      RaisedButton(
                        elevation:5.0,
                        onPressed: (){
                          print("call button prrssed");
                          print(bookedDetails[0].name);
                        },
                        child:Text("CALL at hotel"),),
                      Spacer(),
                      RaisedButton(
                        elevation:5.0,
                        onPressed: (){
                          print("cancelled button pressed");
                        },
                        child: Text("CANCEL"),),

                    ],
                  )

              )


            ],
          )
      );}
else if(count < bookedDetails.length)
  {
    count++;
    return bookedItems();
  }
}




class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
                backgroundColor: Colors.redAccent,
                centerTitle: true,
                title: const Text('Orderings'),
                bottom: TabBar(

                    tabs: [
                      Tab(icon: Icon(Icons.timer),
                        text: "WAITING",),
                      Tab(icon: Icon(Icons.check_box),
                        text: "VISITED",),
                      Tab(icon: Icon(Icons.clear),
                        text: "CANCELLED",),
                    ]

                )
            ),
            body:
            TabBarView(
              children: [


                Column( // 1st tab
                  children: <Widget>[

                    SizedBox(height: 10),
                    Container(

                      color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height:50,
                              child: Row(
                                children: <Widget>[
                                  Text("Kathmandu",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                                  Spacer(),
                                  Text('count down',),

                                ],
                              ),

                            ),
                            Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                            Container(
                              height:150,
                                color: Colors.white,
                                child:
                                Row(
                                  children: <Widget>[
                                     ClipOval(
                                      child: Image.asset(
                                        'images/Momo.jpg',
                                        fit: BoxFit.cover,),
                                    ),
                                    SizedBox(width:50),
                                    Column(
                                      children:<Widget>[
                                        Text(bookedDetails[0].name+", " ,
                                          style: TextStyle(
                                            fontSize: 18,),),
                                        Text(bookedDetails[0].address,
                                          style: TextStyle(
                                            fontSize: 18,),),

                                        Text("Ordered date/time"),
                                        Text(bookedDetails[0].date,
                                            style: TextStyle(
                                              fontSize: 18,)),
                                        Text(bookedDetails[0].oTime,
                                            style: TextStyle(
                                              fontSize: 18,))
                                      ],


                                    ),




                                  ],
                                )

                            ),


                                   //container to colour the space
                            Container(
                              height: 2,
                              color: Colors.grey,
                            ),


                            Container(
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    RaisedButton(
                                        elevation:5.0,
                                        onPressed: (){
                                          print("call button prrssed");
                                          print(bookedDetails[0].name);
                                        },
                                        child:Text("CALL at hotel"),),
                                    Spacer(),
                                    RaisedButton(
                                        elevation:5.0,
                                        onPressed: (){
                                          print("cancelled button pressed");
                                        },
                                        child: Text("CANCEL"),),

                                  ],
                                )

                            )


                          ],
                        )
                    )






                  ],
                ),





                // 2nd tab
                Column(
                  children: <Widget>[
                    SizedBox(height: 0),
                    Container(
                        padding: EdgeInsets.all(32),
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                10.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            )
                          ],
                        ),
                        child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Kathmandu"),
                                  Text('count down here'),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  //  Image.asset(bookedImage[0]),
                                  //Text(bookedName[0]),
                                ],
                              )


                            ]
                        )


                    )
                  ],


                ),

                // 3rd tab
                Column(
                  children: <Widget>[
                    SizedBox(height: 0),
                    Container(
                        padding: EdgeInsets.all(32),
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                10.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            )
                          ],
                        ),
                        child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Kathmandu"),
                                  Text('count down here'),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  // Image.asset(bookedImage[0]),
                                  //Text(bookedName[0]),
                                ],
                              )


                            ]
                        )


                    )
                  ],


                )],

            )
        )
    );
  }
}

