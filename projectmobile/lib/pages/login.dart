import 'package:crudproject/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LoginPage extends StatefulWidget {
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username =TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController status = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height:125),
            Row(
              children: [
                 Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                       child:Image.network(
                        'https://freesvg.org/img/location_icon.png',
                        height:135,
                        width:135,
                      ),
                    ),
                  ),
                ],
              ),
            ),
                
              ],
            ),
          
            Expanded(
              child: Row(
                children: [
                    Expanded(
                    flex: 1,
                    child: Container(
                      child:Text(
                        'Travel Reimbursement Request',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(238, 63, 76, 1),
                            fontSize: 25),
                            textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                                 ],
              ),
            ),
            SizedBox(height: 35),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(

                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child:TextField(
                      controller: username,
                      decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder())),
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
            SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child:TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder())),
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
            SizedBox(height: 35),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: height * 0.45,
                      child: ElevatedButton (
                        style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(215, 255, 255, 255)),
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(238, 63, 76, 1)),
                    ),
                          child: Text("Sign in",style:TextStyle(fontSize:25,color: Color.fromRGBO(255, 255, 255, 1))),
                          
                          onPressed: () {
                          if(username.text=="admin@clicknext.co.th"&& password.text=='1234'){
                          Navigator.push(context, MaterialPageRoute(builder:(context) => MainPage()),);
                            setState((){
                              username.text = 'admin@clicknext.co.th';
                              password.text = '1234';
                              // status.text = 'Login Success';
                              setUsername(username.text);
                              setPassword(password.text);
                              // setStatus(status.text);
                              // print('Login Success');
                              
                            });

                          }
                          else{
                            setState((){
                            status.text = 'อีเมลหรือรหัสผ่านไม่ถูกต้อง โปรดลองอีกครั้ง';
                            print('User = Others');
                            setStatus(status.text);
                            print('Login Failed');
                          });}}),
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
             SizedBox(height: 15),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child:Text("${status.text}",style: TextStyle(fontSize: 17,color: Color.fromRGBO(238, 63, 76, 1)),textAlign: TextAlign.center),
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
      SizedBox(height:10),
      ],),
    ));
  }
   Future<void> setUsername (textUsername) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username',textUsername);
  }
  Future<void> setPassword (textPassword) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('password',textPassword);
  }
  Future<void> setStatus (textStatus) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('status',textStatus);
  }
}