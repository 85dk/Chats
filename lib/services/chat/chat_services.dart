import 'package:chats/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatServices extends ChangeNotifier{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  //send msg
  Future<void> sendMessage(String receiverId,String message)async {
//get current user info
final String currentUserId = auth.currentUser!.uid;
final String currentUserEmail = auth.currentUser!.email.toString();
final Timestamp timestamp = Timestamp.now();
//create a new msg
Message newMessage =   Message(senderId: currentUserId, senderEmail: currentUserEmail, receiverId: receiverId, timestamp: timestamp, message: message);
//chat room
List<String> ids =[currentUserId,receiverId];
ids.sort();
String chatRoomId = ids.join("_");
//add new msg
await store.collection('chat_rooms').doc(chatRoomId).collection('messages').add(newMessage.toMap());

  }
  //get message
Stream<QuerySnapshot> getMessages(String userId,String otherUserId){
  List<String> ids =[userId,otherUserId];
ids.sort();
String chatRoomId = ids.join("_");
return store.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('timestamp',descending:false).snapshots();
}

}