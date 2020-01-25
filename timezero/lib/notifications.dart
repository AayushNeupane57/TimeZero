import 'package:flutter/material.dart';

class NotificationData{
  String value;
  String date;

  NotificationData({this.value,this.date});
}

List <NotificationData> datas=[
  NotificationData(value:"not no 1",date:"jan1"),
  NotificationData(value:"not no 2",date:"jan1"),
  NotificationData(value:"not no 3",date:"jan1"),
  NotificationData(value:"not no 4",date:"jan1"),
  NotificationData(value:"not no 5",date:"jan1"),
  NotificationData(value:"not no 6",date:"jan1"),
  NotificationData(value:"not no 7",date:"jan1"),
  NotificationData(value:"not no 8",date:"jan1"),
  NotificationData(value:"not no 9",date:"jan1"),
  NotificationData(value:"not no 10",date:"jan1"),
  NotificationData(value:"not no 11",date:"jan1"),
  NotificationData(value:"not no 12",date:"jan1"),
];


class NotiFication extends StatefulWidget {
  //NotiFication({Key key}):super(key:key);

  @override
  _NotiFicationState createState() => _NotiFicationState();
}

class _NotiFicationState extends State<NotiFication> {

  Widget NotificationCard(int index)
  {
    return GestureDetector(
      onTap: () {
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => ShowItemDetail(foodItem: h1),
//            ));
      },
//      onHorizontalDrag: (){
//        setState(() {
//          print("inside the set state function");
//          notifications.removeAt(index);
//        });
//      },
      child: Container(
        //provides the gap between container and rest surrounding element
        margin: EdgeInsets.all(10),
        width: MediaQuery
            .of(context)
            .size
            .width ,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipOval(
                child: Image.asset("images/kfc.png"),
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
                  datas[index].value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    datas[index].date,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
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
                print(datas.length);
                setState(() {
                  print("inside the set state function");
                  datas.removeAt(index);
                });
              },
            ),

          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    if (datas.length==0)
      return Scaffold(
        appBar: AppBar(
          title: Text("Notifications",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.redAccent,
          ),
          elevation: 0.0,
        ),
        body:Center(child: Text("No new notifications",style:TextStyle(fontSize: 30),
        ),
        ),
      );
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
        color: Colors.redAccent,
    ),
    elevation: 0.0,
    ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: datas.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Dismissible(
                  key: Key(datas[index].value),
                  onDismissed: (direction){setState(() {
                        datas.removeAt(index);});},
              child:NotificationCard(index));
            })),
      );
  }
}

//class NotificationCard extends StatefulWidget {
//  final String notf;
//  final int index;
//
//  NotificationCard({ UniqueKey key, this.notf,this.index}): super(key:key);
//
//  @override
//  _NotificationCardState createState() => _NotificationCardState();
//}
//
//class _NotificationCardState extends State<NotificationCard> {
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
////        Navigator.push(
////            context,
////            MaterialPageRoute(
////              builder: (context) => ShowItemDetail(foodItem: h1),
////            ));
//      },
//      child: Container(
//        //provides the gap between container and rest surrounding element
//        margin: EdgeInsets.all(10),
//        width: MediaQuery
//            .of(context)
//            .size
//            .width ,
//        decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.circular(15),
//            boxShadow: [
//              BoxShadow(
//                blurRadius: 5,
//                offset: Offset(0, 3),
//                color: Colors.grey,
//              )
//            ]),
//        padding: EdgeInsets.all(15.0),
//        //margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
//        child: Align(
//          alignment: Alignment.center,
//          child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Expanded(
//                flex: 8,
//                child: ClipOval(
//                  child: Image.asset("images/kfc.png"),
//                ),
//              ),
//              SizedBox(
//                width: 10,
//              ),
//              Text(
//                widget.notf,
//                style: TextStyle(
//                  fontSize: 20,
//                  fontWeight: FontWeight.bold,
//                  fontFamily: "poppins",
//                ),
//              ),
//              Spacer(),
//              IconButton(
//                icon: Icon(Icons.delete),
//                onPressed: () {
//                  print(notifications.length);
//                  setState(() {
//                    print("inside the set state function");
//                    notifications.remove(widget.notf);
//                  });
//                },
//              ),
//
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

