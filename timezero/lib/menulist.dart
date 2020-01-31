import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'constants.dart';
import'database.dart';
import 'dart:io';

class MenuList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuList();
  }
}

  class _MenuList extends State<MenuList> {
  String nameOfFood ="";
  double rate = 0;
  String imageAddress = "";

    final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context) {
      return
        Scaffold(

          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            centerTitle: true,
            title: const Text('Menu List'),),
          body:
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.text_fields),
                                        hintText: 'Enter the name of the food item',
                                        labelText: 'Food Name',
                                      ),
                                      onSaved: (String value) {
                                       print(value);
                                       nameOfFood = value;
                                      },
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:TextFormField(
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.text_fields),
                                        hintText: 'Enter the rate',
                                        labelText: 'Rate',
                                      ),
                                      onSaved: (String value) {

                                        rate = double.parse(value) ;
                                        print(rate);
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:TextFormField(
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.text_fields),
                                        hintText: 'choose photo',
                                        labelText: 'Photo',
                                      ),
                                      onSaved: (String value) {

                                        imageAddress = value;
                                        print(imageAddress);
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      child: Text("Submit"),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          setState(() {
                                            foodDetail.add( FoodDetail(nameOfFood ,"Chow%20Mein.jpg?alt=media&token=242660c5-1369-4ad5-8077-eaba5835c66b",rate));
                                            Navigator.of(context, rootNavigator: true).pop('dialog');
                                          });
                                        }
                                      },
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Text("Add on menu list",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  )),
                ),
                SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                      itemCount: foodDetail.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: Key(foodDetail[index].name),
                            onDismissed: (direction) {
                              setState(() {
                                foodDetail.removeAt(index);
                              });
                            },
                            child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex:1,
                                        child: Text('${index+1}.',style:kMenuStyle)),
                                    Expanded(
                                      flex:2,
                                      child: CircleAvatar(
                                  backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/timezero-2c099.appspot.com/o/images%2F${foodDetail[index].image}"),
                                  minRadius: 20,
                                  maxRadius: 20,
                                      ),
                                    ),
                                    Expanded(
                                        flex:3,
                                        child: Text(foodDetail[index].name,style:kMenuStyle)),

                                    Expanded(
                                        flex:2,
                                        child: Text("Rs. ${foodDetail[index].rate}",style:kMenuStyle)),

                                  ],
                                ));
                      }),
                )

              ],
            ),
          ),
        );
    }
  }
