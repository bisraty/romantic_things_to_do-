

import 'package:flutter/material.dart';
class DescriptionPage extends StatefulWidget {
  DescriptionPage({this.description,this.title});
final description;
final title;
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text('Romantic Things Todo List ')),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.90,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(520, 400))
            ),),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${widget.title}",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                      ),),
                  ),),

                Card(
                color: Colors.pink,

                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${widget.description}",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                        fontStyle: FontStyle.italic
                    ),),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
