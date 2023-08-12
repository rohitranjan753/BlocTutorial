import 'package:blocktutorial/authentication/verify_phone_screen.dart';
import 'package:flutter/material.dart';

class SignScreen extends StatelessWidget {
    TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In with email'),
        ),
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
             TextField(
               maxLength: 10,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: 'Phone Number',
                 counterText: ""
               ),
             ),
              SizedBox(height: 10,),
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyPhoneScreen()));

              },child: Text('Sign In'),),
            ],
          ),
        ));
  }
}
