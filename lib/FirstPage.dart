import 'dart:async';

import 'package:flutter/material.dart';
import 'package:romantic_things_to_do/HomePage.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void nextpage(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
            ()=> Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false));
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Container(
              // MediaQuery.of(context).size.height,

                width: MediaQuery.of(context).size.width,
                child: Image.asset('images/heart-love.gif')),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height*0.1,
              left:MediaQuery.of(context).size.width*.3 ,
              child: Text("  WELCOME  ",
                style: TextStyle(color: Colors.pink,fontSize: 24),)),
          Positioned(
              left:MediaQuery.of(context).size.width*.2 ,
              top: MediaQuery.of(context).size.height*0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.pink,
                  ),
                  Padding(padding: EdgeInsetsDirectional.only(top: 20),
                  ),
                  Text( 'Romantic things ToDo List',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),)
                ],
              ))
        ],),
    );
  }
}
