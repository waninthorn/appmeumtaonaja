import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crudproject/pages/add.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Listdata extends StatefulWidget {
  const Listdata({Key?key}):super(key:key);
  @override
  _ListdataState createState() => _ListdataState();
}


class _ListdataState extends State<Listdata> {
  List dataListItem = ['Book title 1', 'Book title 2', 'Book title 3', 'Book title 4', 'Book title 5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:Text("List of Data"),),
     body: listData(),
     floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => AddPage()));
      },
      child:Icon(Icons.add_comment),
      ),
    );
  }

    Future getData () async{

    var url =Uri.https('http://10.80.74.246:80','/api/v3/user/theUser');//ชื่เอเว็บ + path
    var response = await http.get(url);
    var result = json.decode(response.body);
    

    return result;
    
  }
  
  Widget listData(){
      return ListView.builder(
        itemCount: dataListItem.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text("Item ${dataListItem[index]}"),
            trailing: Icon(Icons.more_vert),
          ));
      });
  }
}

