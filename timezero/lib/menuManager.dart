import 'package:flutter/material.dart';
//import './products.dart';


class FoodDetail {
  String name;
  FileImage image;
  double rate;
  FoodDetail(this.name,this.image,this.rate);

}


class ProductManager extends StatefulWidget {
  final String name;
  final FileImage image;
  final double rate;


  ProductManager(this.name, this.image, this.rate);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManagerState();
  }
}


class _ProductManagerState extends State<ProductManager>{
  List<FoodDetail> _products = [];


//  @override
//  void initState() {
//    _products.add(FoodDetail(widget.name,widget.image, widget.rate));
//    super.initState();
//  }



  @override
  Widget build(BuildContext context) {
    return Column(children:[Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          setState((){
            _products.add(FoodDetail(widget.name,widget.image, widget.rate));
          });
        },
        child: Text("Add product"),
      ),
    ),
//      Products(_products)
    ],);
  }

}