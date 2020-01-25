import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';



class Map extends StatefulWidget {
 String location;


Map(this.location);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Map();
  }
}

class _Map extends State<Map> {

  final Geolocator geoLocator = Geolocator()..forceAndroidLocationManager;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.location_on,
              color: Colors.blue,),
            onPressed: () {
//              getLocation();
              geoLocator
                  .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
                  .then((Position _currentPosition) {
                  print(_currentPosition);
                  print(_currentPosition);
                  launch("https://www.google.com/maps/dir/?api=1&origin=${_currentPosition.latitude},${_currentPosition.longitude}&destination=${widget.location}");

                  });



            },
          ),
        Text("View on map",
            style: TextStyle(
                fontSize: 14))
      ],
    );



  }

//  void getLocation() async {
//    Position _currentPosition = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//    print(_currentPosition);
//    launch("https://www.google.com/maps/dir/?api=1&origin=${_currentPosition.latitude},${_currentPosition.longitude}&destination=${widget.location}");

  }



