import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crudproject/pages/todolist.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Data List",
      home: Todolist(),
      );
  }
}

// class MainPage extends StatefulWidget{
//   const MainPage({Key?key}):super(key:key);
//   @override
//   _MainPageState createState()=>_MainPageState();
// }
// class _MainPageState extends State<MainPage>{
//   int _currentIndex =0;
//   final tabs =[Home(),CalculatePage(),ContactPage()];
//   @override
//   Widget build(BuildContext context){
//     return  Scaffold(
//         appBar: AppBar(
//           title: const Text('Donut Shop')),
//           body:tabs[_currentIndex],
//           bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home),label:"HomePage"),
//             BottomNavigationBarItem(icon: Icon(Icons.calculate),label:"CalculatePage"),
//             BottomNavigationBarItem(icon: Icon(Icons.contact_mail),label:"ContactPage")
//           ],
//           onTap:(index){
//             setState((){
//               print(index);
//               _currentIndex=index;
//             });
//           },
//       ));
//   }
// }