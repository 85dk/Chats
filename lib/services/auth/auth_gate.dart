import 'package:chats/pages/Homepage.dart';
import 'package:chats/services/auth/loginor%20regiatration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
        if(snapshot.hasData){
          return Homepage();
        }else{
          return Loginorregister();
        }
      }),
    );
  }
}