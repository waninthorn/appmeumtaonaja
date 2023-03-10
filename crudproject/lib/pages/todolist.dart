import 'package:crudproject/pages/update_todo.dart';
import 'package:flutter/material.dart';
import 'package:crudproject/pages/add.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class Todolist extends StatefulWidget {
  //const Todolist({ Key? key }) : super(key: key);

  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
//dummy ต้นแบบข้อมูล
  List todolistitems = ['A','B','C','D'];

  @override
  void initState(){
    super.initState();
    getTodolist();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPage()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  getTodolist();
                });
              },
              icon: Icon(
                Icons.refresh,
                color: Color.fromARGB(255, 0, 0, 0),
              ))
        ],

          title: Text('All Todolist'),
        ),
        body: todolistCreate());
  }

  Widget todolistCreate(){
    return ListView.builder(
      itemCount: todolistitems.length,
      itemBuilder: (context, index){
        return Card(child: ListTile(
        leading: FlutterLogo(),
        title: Text("${todolistitems[index]['title']}"), onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdatePage(
                            todolistitems[index]['id'],
                            todolistitems[index]['title'],
                            todolistitems[index]['detail']))).then((value) {
                              setState(() {
                                getTodolist();
                              });
                            });
              },
        trailing: Icon(Icons.more_vert),
        ) );
      }
    );
  }
  Future getTodolist() async {
    List alltodo = [];
     var url =Uri.http('127.0.0.1:80','/api/all-todolist/');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todolistitems = jsonDecode(result);
    });
  }
}

