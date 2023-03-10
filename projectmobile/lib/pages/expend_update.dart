import 'package:crudproject/pages/home.dart';
import 'package:crudproject/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
  // const UpdatePage({ Key? key }) : super(key: key);
  final v1,v2,v3,v4,v5,v6;
  const UpdatePage(this.v1,this.v2,this.v3,this.v4,this.v5,this.v6);
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var _v1,_v2,_v3,_v4,_v5,_v6;
TextEditingController dateInput = TextEditingController();
TextEditingController id_project =TextEditingController();
TextEditingController name_project =TextEditingController();
TextEditingController detail = TextEditingController();
TextEditingController total = TextEditingController();
  @override
  void initState(){
    dateInput.text = "";
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
    _v5 = widget.v5;
    _v6 = widget.v6;
    dateInput.text=_v2;
    id_project.text=_v3;
    name_project.text=_v4;
    detail.text=_v5;
    total.text=_v6;
  }
  
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions:[
            IconButton( 
              onPressed: (){
                print("Delete ID:$_v1");
                deleteExpend().then((value){Navigator.pop(context);});
              },
              icon:Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 255, 255),
                ))
          ],
        backgroundColor:Color.fromRGBO(238, 63, 76, 1) ,
           title: const Text('Travel Reimbursement Request',
           style: const TextStyle(
                   color: Color.fromRGBO(255, 255, 255, 1),
                   fontSize: 20),
                  textAlign: TextAlign.center,
             ),),
           body: SafeArea(
        child: Column(
          children: [
            SizedBox(height:5),
            Expanded(
              child: Row(
                children: [
                   Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: TextField(
                    controller: dateInput,
                  decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "วันที่เดินทาง" //label text of field
                  ),
                  readOnly: true,
                  onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(
                            pickedDate); 
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); 
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                    ),
                  ),
                    Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child:TextField(
                      controller: id_project,
                      decoration: InputDecoration(
                      labelText: 'รหัสโครงการ', border: OutlineInputBorder())),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                 Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child:TextField(
                      controller: name_project,
                      decoration: InputDecoration(
                      labelText: 'ชื่อโครงการ', border: OutlineInputBorder())),
                    ),
                  ),
                   Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                   Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child:TextField(
                      controller: detail,
                      decoration: InputDecoration(
                      labelText: 'รายละเอียดการเบิก', border: OutlineInputBorder())),
                    ),
                  ), Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                    Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child:TextField(
                      controller: total,
                      decoration: InputDecoration(
                      labelText: 'จำนวนเงิน', border: OutlineInputBorder())),
                    ),
                  ),
                   Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                ],
              ),
            ),                 
             Expanded(
              child: Row(
                children: [
                  SizedBox(height:30,),
                    Expanded(
                    flex: 1,
                    child: Container(),
                   ),
                  Expanded(
                    flex: 2,
                    child: Container(
                     child:TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(215, 255, 255, 255)),
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(216, 52, 202, 22)),
                    ),
                    onPressed: () { 
                    print("------------");
                    print('dateInput: ${dateInput.text}');
                    print('id_project: ${id_project.text}');
                    print('name_project: ${name_project.text}');
                    print('detail_expend: ${detail.text}');
                    print('total: ${total.text}');
                    updateExpend();
                    final snackBar = SnackBar(content: const Text('อัพเดตรายการเรียบร้อย'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState((){
                    dateInput.clear();
                    id_project.clear();
                    name_project.clear();
                    detail.clear();
                    total.clear();
                    });},
                    child: Text('แก้ไข',style: TextStyle(fontSize: 25))),
                      height: height * 0.10,         
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                ],
              ),
            ),                                
            SizedBox(height:20,),
          ],
        ),
      ),
    );
  }
  Future updateExpend() async {
    //
    var url = Uri.http('127.0.0.1:80','/api/update-expend/$_v1');
    //ประเภทของ Data ที่เราจะส่งไป เป็นแบบ json
    Map<String, String> header = {"Content-type": "application/json"};
    //Data ที่จะส่ง
    String jsondata =
         '{"dateInput":"${dateInput.text}","id_project":"${id_project.text}", "name_project":"${name_project.text}", "detail":"${detail.text}", "total":"${total.text}"}';

    //เป็นการ Response ค่าแบบ POST
    var response = await http.put(url, headers: header, body: jsondata);
    print('------result-------');
    print(response.body);
  }
 Future deleteExpend() async {
    var url = Uri.http('127.0.0.1:80', '/api/delete-expend/$_v1');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
    print('------result-------');
    print(response.body);
  }

}

