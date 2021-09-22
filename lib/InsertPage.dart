import "package:flutter/material.dart";
import 'package:romantic_things_to_do/DatabaseHelper.dart';
import 'package:romantic_things_to_do/HomePage.dart';


class Insert extends StatefulWidget {


  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final descriptionTextController = TextEditingController();
  final titleTextController = TextEditingController();
  String title='';
  String discription="";
  final dbHelper = DatabaseHelper.instance;

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.title : title,
      DatabaseHelper.description  : discription
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }
  @override
  void dispose() {
    super.dispose();
    descriptionTextController.dispose();
    titleTextController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.pink,

      title: Text("Add Todo list"),
      ),
      body:ListView(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(520, 400))
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value){
                title=value;
              },
              decoration: InputDecoration(

                  border: OutlineInputBorder(

                  ), labelText: "Title"),
              maxLines: 1,
              controller: titleTextController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value){
                discription=value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Description"),
              maxLines: 10,
              controller: descriptionTextController,
            ),
          ),
        Container(
       child:   FlatButton.icon(

                      onPressed: (){
                      setState(() {
                        _insert();
                        // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>HomePage())
                        //     , (route) => false);
                        Navigator.pop(context, "Your todo has been saved.");
                      });


                      },
                      icon: Icon(Icons.add,color: Colors.white),
                    label:Text("Save ",
                        style:TextStyle(
                          fontSize: 24
                        )
                    ),
                    shape: StadiumBorder(),
                    color: Colors.pinkAccent,
                     textColor: Colors.white,
                     )
        )
        ],
      )
    );
  }
}
