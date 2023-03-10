import 'package:crudproject/pages/home.dart';
import 'package:crudproject/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class InsertPage extends StatefulWidget{
  const InsertPage({Key?key}):super(key:key);
  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage>{
TextEditingController dateInput = TextEditingController();
TextEditingController id_project =TextEditingController();
TextEditingController name_project =TextEditingController();
TextEditingController detail = TextEditingController();
TextEditingController total = TextEditingController();

  @override
  void initState() {
    // dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(238, 63, 76, 1) ,
           title: const Text('Travel Reimbursement Request',
           style: const TextStyle(
                   color: Color.fromRGBO(255, 255, 255, 1),
                   fontSize: 18),
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
                    postExpend();
                    setState((){
                    dateInput.clear();
                    id_project.clear();
                    name_project.clear();
                    detail.clear();
                    total.clear();
                    });},
                    child: Text('ยืนยัน',style: TextStyle(fontSize: 25))),
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
   Future postExpend() async {
    try{
      //http://10.80.74.246:8080/api/v3/user
    var url = Uri.http('127.0.0.1:80','/api/post-expend');
    //ประเภทของ Data ที่เราจะส่งไป เป็นแบบ json
    Map<String, String> header = {"Content-type": "application/json"};
    //Data ที่จะส่ง
    String jsondata =
        '{"dateInput":"${dateInput.text}","id_project":"${id_project.text}", "name_project":"${name_project.text}", "detail":"${detail.text}", "total":"${total.text}"}';

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