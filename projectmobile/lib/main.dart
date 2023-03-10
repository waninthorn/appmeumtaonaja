import 'package:crudproject/pages/expend_insert.dart';
import 'package:crudproject/pages/home.dart';
import 'package:crudproject/pages/login.dart';
import 'package:crudproject/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:responsive_framework/responsive_framework.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 375,
          
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(375, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
          home: LoginPage()
          // home:MainPage()
    );
  }
}
class MainPage extends StatefulWidget{
  const MainPage({Key?key}):super(key:key);
  @override
  _MainPageState createState()=>_MainPageState();
}
class _MainPageState extends State<MainPage> {
    @override

  final tabs =[HomePage(),InsertPage(),ProfilePage()];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),InsertPage(),ProfilePage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 25.0),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined,size: 35.0),
            label: 'เพิ่มคำขอเบิก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,size: 25.0),
            label: 'ข้อมูลผู้ใช้งาน',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(238, 63, 76, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
