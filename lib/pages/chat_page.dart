import 'package:chats/components/chat_bubble.dart';
import 'package:chats/components/my_text_fields.dart';
import 'package:chats/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiveruserEmail;
  final String receiveruserId;
  const ChatPage({super.key,required this.receiveruserEmail,required this.receiveruserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

final TextEditingController messagecontroller = TextEditingController();
final ChatServices chatServices = ChatServices();
final FirebaseAuth auth = FirebaseAuth.instance;
//check if it empty
void sendMessage()async {
if(messagecontroller.text.isNotEmpty){
  await chatServices.sendMessage(widget.receiveruserId, messagecontroller.text);
  messagecontroller.clear();
}
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiveruserEmail),),
      body: Column(children: [
        Expanded(child: _buildmessagelist()),

        //user input 
        _buildmessageInput(),
        const SizedBox(height: 25,),
      ],),
    );
  }
  //biuld msg list
  Widget _buildmessagelist(){
    return StreamBuilder(stream: chatServices.getMessages(widget.receiveruserId, auth.currentUser!.uid,),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Text('Error${snapshot.error}');
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Text('Loading ....');
      }
      return ListView(
        children : snapshot.data!.docs.map((document)=> _buildmessageItem(document)).toList());
    },
    );
  }
  //build msg item
  Widget _buildmessageItem(DocumentSnapshot document){
    Map<String,dynamic> data = document.data() as Map<String,dynamic>;
    var aligment = (data['senderId'] == auth.currentUser!.uid) 
    ? Alignment.centerRight 
    : Alignment.centerLeft;
    return Container(alignment: aligment,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: (data['senderId'] == auth.currentUser!.uid)
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start,
        children: [
          Text((data['senderEmail'])),
          const SizedBox(height: 5,),
           ChatBubble(message: data['message']),
        ],
      ),
    ),
    );
  }
  //build input
  Widget _buildmessageInput(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(child: MyTextField(controller: messagecontroller, hintText: 'Enter Message', obscureText: false)),
          IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward,size: 30,))
        ],
      ),
    );
  }

}