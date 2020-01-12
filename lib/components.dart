import 'package:flutter/material.dart';

class StackedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height:50,
              width:50,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:BorderRadius.circular(50)
              ),
              child: Icon(
                Icons.home,
                color:Colors.green,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:55),
            child: Container(
              height:50,
              width:50,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius:BorderRadius.circular(50)
              ),
              child: Icon(
                Icons.timer_off,
                color:Colors.green,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
            child: Container(
              height:50,
              width:50,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:BorderRadius.circular(50)
              ),
              child: Icon(
                Icons.email,
                color:Colors.green,
                size: 30,
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