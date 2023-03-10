import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key?key}):super(key:key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
String? txtUsername = '';
String? txtPassword = '';
String? txtStatus = '';
  @override
  void initState(){
    super.initState();
    getUsername();
    getPassword();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(238, 63, 76, 1) ,
           title: const Text('Travel Reimbursement Request',
           style: const TextStyle(
                   color: Color.fromRGBO(255, 255, 255, 1),
                   fontSize: 18),
                  textAlign: TextAlign.center,
             ),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child:Center(
          child: Text("${txtUsername} and ${txtPassword}"),
        )
      ),
    );

  }
    Future<void> getUsername() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('username');
    setState(() {
      txtUsername = myStr;
    });
  }
    Future<void> getPassword() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('password');
    setState(() {
      txtPassword = myStr;
    });
  }
    Future<void> getStatus() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('status');
    setState(() {
      txtStatus = myStr;
    });
  }
}
