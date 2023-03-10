import 'package:crudproject/pages/listdata.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class UpdatePage extends StatefulWidget {
  // const UpdatePage({ Key? key }) : super(key: key);
  final v1,v2,v3;
  const UpdatePage(this.v1,this.v2,this.v3);
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var _v1,_v2,_v3;
  TextEditingController title =TextEditingController();
  TextEditingController detail = TextEditingController();
  @override
  void initState(){
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    title.text=_v2;
    detail.text=_v3;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('แก้ไข'),
          actions:[
            IconButton( 
              onPressed: (){
                print("Delete ID:$_v1");
                deleteTodo().then((value){Navigator.pop(context);});
              },
              icon:Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
      ),
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
                updateTodo();
                final snackBar = SnackBar(content: const Text('อัพเดตรายการเรียบร้อย'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // setState((){
              //   title.clear();
              //   detail.clear();
              // });
              },
              child: Text("แก้ไข"),
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
  Future updateTodo() async {
    //
    var url = Uri.http('127.0.0.1:80','/api/update-todolist/$_v1');
    //ประเภทของ Data ที่เราจะส่งไป เป็นแบบ json
    Map<String, String> header = {"Content-type": "application/json"};
    //Data ที่จะส่ง
    String jsondata =
        '{"title":"${title.text}", "detail":"${detail.text}"}';

    //เป็นการ Response ค่าแบบ POST
    var response = await http.put(url, headers: header, body: jsondata);
    print('------result-------');
    print(response.body);
  }
 Future deleteTodo() async {
    var url = Uri.http('127.0.0.1:80', '/api/delete-todolist/$_v1');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
    print('------result-------');
    print(response.body);
  }

}


