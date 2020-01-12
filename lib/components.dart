import 'package:flutter/material.dart';
import 'package:time_zero_ui/login.dart';
import 'home.dart';

class StackedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Container(
              height:80,
              width:80,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:BorderRadius.circular(60)
              ),
              child: Icon(
                Icons.home,
                color:Colors.green,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:55),
            child: Container(
              height:80,
              width:80,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius:BorderRadius.circular(60)
              ),
              child: Icon(
                Icons.timer_off,
                color:Colors.green,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(39, 30, 0, 0),
            child: Container(
              height:80,
              width:80,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:BorderRadius.circular(50)
              ),
              child: Icon(
                Icons.email,
                color:Colors.green,
                size: 60,
              ),
            ),
          ),
        ]
    );
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
class containerWithSize extends StatelessWidget {
  final double height;
  final double width;
  final String text ;

  containerWithSize(
  this.height,
  this.width,
  this.text
  );

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15,
              offset: Offset(0,10),
            ),
            BoxShadow(
              color: Colors.grey,
                offset: Offset(0,0)
            )
          ]
      ),
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
Widget create_Inkwell( BuildContext ctx, double height1, double width1, String s1)
{
  return Container(
      width: width1,
      height: height1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0xFF17ead9),
            Color(0xFF6078ea),
          ])),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if(s1=="Sign In")
                {

                  Navigator.push(ctx,MaterialPageRoute(
                    builder: (context)=>Home(),));
                }
              if(s1=="Login")
              {

                Navigator.push(ctx,MaterialPageRoute(
                  builder: (context)=>Login(),));
              }

            },
            child: Center(
                child: Text(
                  s1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Poppins-Black",
                  ),
                )),
          )
      )
  );


}

