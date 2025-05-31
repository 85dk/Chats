//loginorregister

import 'package:chats/pages/login_page.dart';
import 'package:chats/pages/registration%20page.dart';
import 'package:flutter/material.dart';

class Loginorregister extends StatefulWidget {
  const Loginorregister({super.key});

  @override
  State<Loginorregister> createState() => _LoginorregisterState();
}

class _LoginorregisterState extends State<Loginorregister> {
  //initially show the login screen
  bool showloginpage= true;
  //oggle between login and register
  void togglepages(){
   setState(() {
      showloginpage = !showloginpage; 
   });
  }
  @override
  Widget build(BuildContext context) {
   if(showloginpage){
    return LoginPage(onTap: togglepages);
   }else
   {
     return RegisterPage(onTap: togglepages);
   }
  }
}