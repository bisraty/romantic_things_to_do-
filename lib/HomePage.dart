
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:romantic_things_to_do/DescriptionPage.dart';

import 'package:sqflite/sqflite.dart';

import 'DatabaseHelper.dart';
import 'InsertPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todo=[];
  final dbHelper = DatabaseHelper.instance;
  _query() async {

    Database? db = await DatabaseHelper.instance.database;

    List<Map> result = await db!.query(DatabaseHelper.table);

    todo.clear();
 result.forEach((row) {

  return  todo.add(row);

}

);
    print(todo);
   }
  void _delete(_id) async {

    final id = _id;
    final rowsDeleted = await dbHelper.delete(id!);
    print('deleted $rowsDeleted row(s): row $id');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _query();
    });
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      _query();
    });

  // print( todo[0]['description']);

    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text('Romantic Things Todo List ')),
      ),
      body:Stack(

        children: [
          Container(
            height: MediaQuery.of(context).size.height*.90,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(520, 400))
            ),),
        ListView.builder
            ( itemCount: todo.length,
              itemBuilder: (context, index){

                return ListTile(
                  title: Column(children: [

                    Container(
                      height:60,

                      child: GestureDetector(
                        onTap:(){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                DescriptionPage(
                                  title: todo[index]['title'],
                                 description: todo[index]['description'],
                                )));
                          });
                        },
                        child: Card(

                            color: Colors.pink,
                            child:Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                               "${index +1 }.",

                                style:TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,

                                )),
                            Text(
                                todo[index]['title'],

                                style:TextStyle(
                                   color: Colors.white,
                                  fontSize: 24,

                                )),
                           IconButton(onPressed:(){
                             setState(() {
                               _delete(todo[index]['_id']);
                               _query();
                             });
                           },
                               alignment: Alignment.topRight,
                               icon: Icon(Icons.delete,
                                 color: Colors.white,
                               ))
                          ],
                        )
                    ),
                      ),

                    )],),
                );

              }),
          Positioned(
            top:MediaQuery.of(context).size.height*.75,
            left: MediaQuery.of(context).size.width*.80,
            child: FloatingActionButton(
              backgroundColor: Colors.orange,
               onPressed: () {
              //   Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>Insert())
              //       , (route) => false);
   Navigator.push(context, MaterialPageRoute(builder: (context) =>Insert()));
    },
    child: Icon(Icons.add)),
          ),


        ],
      )
    );
  }
}
