import 'package:chats/pages/chat_page.dart';
import 'package:chats/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signout() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Chats')),
        actions: [
          IconButton(onPressed: signout, icon: const Icon(Icons.logout))
        ],
      ),
      body: _buildUserList(),
    );
  }

  // Build a list of users excluding the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Filter out current user and build list items
        final users = snapshot.data!.docs.where((doc) {
          return auth.currentUser!.email != doc['email'];
        }).toList();

        return ListView(
          children: users.map((doc) => _buildUserListItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    return ListTile(
      title: Text(data['email']),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiveruserEmail: data['email'],
              receiveruserId: data['uid'],
            ),
          ),
        );
      },
    );
  
  }
}
