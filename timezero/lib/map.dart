import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Map extends StatefulWidget {
 String position;

Map(this.position);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Map();
  }
}

class _Map extends State<Map> {




  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.location_on,
              color: Colors.blue,),
            onPressed: () {
              String position = widget.position;
//            String position = "27.6815169,85.321739,17z";
              String googleUrl= "https://www.google.com/maps/@"+position;
              print(position);
//              print(googleUrl);
              launch(googleUrl);
//              launch("https://www.google.com/maps/@27.6690296,85.2825928,15z");
            },
          ),
        Text("View on map",
            style: TextStyle(
                fontSize: 14))
      ],
    );
  }
}
