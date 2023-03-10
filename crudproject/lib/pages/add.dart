import 'package:crudproject/pages/listdata.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AddPage extends StatefulWidget {
  
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController title =TextEditingController();
  TextEditingController detail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('AddPage')),
      body: Padding(
      padding:const EdgeInsets.all(15.0),
      child:ListView(
      children: [
        Center(
        child: Column(
            children: [
            //  Text(
            //   'Login',
            //   style: const TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.blueGrey,
            //       fontSize: 30),
            //       textAlign: TextAlign.center,
            // ),

            SizedBox(height: 25),
            TextField(
            controller: title,
            // obscureText: true,
            decoration: InputDecoration(
            labelText: 'รายการที่ต้องทำ', border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextField(
            controller: detail,
            decoration: InputDecoration(
            labelText: 'รายละเอียด', border: OutlineInputBorder())),
            SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(20),
              child:ElevatedButton(
              onPressed: () {
                print("------------");
                print('title: ${title.text}');
                print('detail: ${detail.text}');
                postTodo();
              setState((){
                title.clear();
                detail.clear();
              });
              },
              child: Text("เพิ่มรายการ"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 214, 181, 73)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
           
            ),

            ],
        
          ),
          
        )
      ],
      ),
      ),
    );
    
  }
    Future postTodo() async {
    try{
      //http://10.80.74.246:8080/api/v3/user
    var url = Uri.http('127.0.0.1:80','/api/post-todolist');
    //ประเภทของ Data ที่เราจะส่งไป เป็นแบบ json
    Map<String, String> header = {"Content-type": "application/json"};
    //Data ที่จะส่ง
    String jsondata =
        '{"title":"${title.text}", "detail":"${detail.text}"}';

    //เป็นการ Response ค่าแบบ POST
    var response = await http.post(url, headers: header , body:jsondata );
        print('------result-------');
    print(response.body);
    }catch(err){
      print("error");
      print(err);
    }
  }
}


