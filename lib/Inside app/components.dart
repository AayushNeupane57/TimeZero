import 'package:flutter/material.dart';

import 'restaurant.dart';

List<String> Catagories = ["All", "Popular", "Dessert", "Snack", "Fast Food"];

class StackedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(60)),
          child: Icon(
            Icons.home,
            color: Colors.green,
            size: 50,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 55),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(60)),
          child: Icon(
            Icons.timer_off,
            color: Colors.green,
            size: 50,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(39, 30, 0, 0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(50)),
          child: Icon(
            Icons.email,
            color: Colors.green,
            size: 60,
          ),
        ),
      ),
    ]);
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dont worry"),
      ),
    );
  }
}

class ContainerWithSize extends StatelessWidget {
  double height;
  double width;
  String text;

  ContainerWithSize(this.height, this.width, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
            BoxShadow(color: Colors.grey, offset: Offset(0, 0))
          ]),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins-Black",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up here"),
      ),
    );
  }
}

//class CustomInkwell extends StatelessWidget {
//
//  double height1,width1;
//  String s1;
//  BuildContext ctx;
//  @override
//  CustomInkwell({this.ctx,this.height1,this.width1,this.s1});
//  Widget build(BuildContext ctx) {
//    return  Container(
//        width: width1,
//        height: height1,
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(20),
//            gradient: LinearGradient(colors: [
//              Color(0xFF17ead9),
//              Color(0xFF6078ea),
//            ])),
//        child: Material(
//            color: Colors.transparent,
//            child: InkWell(
//              onTap: () {
//                if (s1 == "Sign In") {
//                  Navigator.push(
//                      ctx,
//                      MaterialPageRoute(
//                        builder: (context) => Home2(),
//                      ));
//                }
//                if (s1 == "Login") {
//                  Navigator.push(
//                      ctx,
//                      MaterialPageRoute(
//                        builder: (context) => Login(),
//                      ));
//                }
//              },
//              child: Center(
//                  child: Text(
//                    s1,
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 30,
//                      fontFamily: "Poppins-Black",
//                    ),
//                  )),
//            )));
//  }
//}


class ItemCard extends StatelessWidget {
  final String nameToDisplay;
  final String imagesToDisplay;
  final String distanceToDisplay;
  final String ratingToDisplay;

  ItemCard({this.nameToDisplay, this.imagesToDisplay, this.distanceToDisplay,this.ratingToDisplay});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantPage( nameOfRestaurant:nameToDisplay,
                  ratingOfRestaurant:ratingToDisplay,distanceOfRestaurant:distanceToDisplay,image:imagesToDisplay),
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
                child: Image.asset(imagesToDisplay),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              nameToDisplay,
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
                  child: DisplayRating(rating: 5),
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
        itemCount: Catagories.length,
        itemBuilder: (BuildContext context, int id) {
          return CatagoriesButton(
            title: Catagories[id],
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
