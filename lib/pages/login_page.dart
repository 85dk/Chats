//login_page
import 'package:chats/components/my_button.dart';
import 'package:chats/components/my_text_fields.dart';
import 'package:chats/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

//controller
final emailController = TextEditingController();
final passwordController = TextEditingController();
//sigin
void signIn() async{
  final authService = Provider.of<AuthService>(context,listen: false);
  try{
     await authService.signInWithEmailandPassword(emailController.text,passwordController.text);
  }catch(e){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString())));
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                //logo
                Icon(Icons.chat,size:100 ,color: Colors.grey[800],),
                const SizedBox(height: 25,),
                //welcome
                Text("Welcome come back ",style: TextStyle(fontSize: 16),),
                const SizedBox(height: 25,),
                //email
                MyTextField(controller: emailController, hintText: 'Enter Email', obscureText: false),
                const SizedBox(height: 10,),
                //password
                 MyTextField(controller: passwordController, hintText: 'Enter Password', obscureText: true),
                 const SizedBox(height: 25,),
                //sign
                MyButton(onTap: signIn, text: 'Sign In'),
                const SizedBox(height: 50,),
                //not a member
                Row(children: [Text('Not a member?'),
                const SizedBox(width: 4,),
                GestureDetector(onTap: widget.onTap,child: Text('Register now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)))
                ],)
                // 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
