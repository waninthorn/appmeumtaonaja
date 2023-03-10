import 'package:crudproject/pages/expend_insert.dart';
import 'package:crudproject/pages/expend_update.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:crudproject/pages/home.dart';
import 'package:crudproject/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key?key}):super(key:key);
  @override
   State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
 List items = [1,2,3,4,5,6,7];
void initState(){
    super.initState();
    getExpend();
}

  @override
 Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  getExpend();
                });
              },
              icon: Icon(
                Icons.refresh,
                color: Color.fromRGBO(245, 243, 243, 1),
              ))
        ],
        backgroundColor:Color.fromRGBO(238, 63, 76, 1) ,
           title: const Text('Travel Reimbursement Request',
           style: const TextStyle(
                   color: Color.fromRGBO(255, 255, 255, 1),
                   fontSize: 18),
                  textAlign: TextAlign.center,
             ),),
        body: expendCreate());
  }
  Widget expendCreate(){
    
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return Card(child: ListTile(
        leading: Image.network(
                        'http://www.clker.com/cliparts/2/9/b/8/1194984775760075334button-green_benji_park_01.svg.med.png',
                        height:15,
                        width:15,
                      ),
        title: Text("${items[index]['name_project']}"), onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdatePage(
                            items[index]['id'],
                            items[index]["dateInput"],
                            items[index]['id_project'],
                            items[index]['name_project'],
                            items[index]['detail'],
                            items[index]['total'],
                            )
                            )).then((value) {
                              setState(() {
                                getExpend();
                              });
                            });
              },
        trailing: Image.network(
                        'https://icons.veryicon.com/png/o/education-technology/smart-campus-1/view-details-2.png',
                        height:25,
                        width:25,
                      ),
        ) );
      }
    );
  }
    Future getExpend() async {
    List allexpend = [];
     var url =Uri.http('127.0.0.1:80','/api/all-expend/');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
    items = jsonDecode(result);
    });
  }
  }

