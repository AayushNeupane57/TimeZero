import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StackedLogo(),
                SizedBox(
                  height: 50,
                ),

                Text(
                  "TimezERo",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,

                  )
                ),
                SizedBox(
                  height:50,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width:20,
                    ),
                    Expanded(
                      child: create_Inkwell(context, 65, 100,"Login")

                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],

                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width:20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                          height:50,
                          alignment: Alignment.center,

                          child:Text(
                              "Facebook",
                              style:TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              )
                          )

                      ),
                    ),
                    SizedBox(
                      width:20,
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color:Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height:50,
                          alignment: Alignment.center,
                          child:Text(
                              "Google",
                              style:TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              )
                          )

                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],

                )

              ]
          ),
        )
    );
  }
}

