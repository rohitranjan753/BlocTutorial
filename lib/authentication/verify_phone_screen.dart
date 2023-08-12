import 'package:blocktutorial/authentication/home_page.dart';
import 'package:flutter/material.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone'),
      ),
      body: ListView(
        children: [
          TextField(
            maxLength: 6,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter 6 digit code'
            ),
          ),
          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },child:Text('Verify'))
        ],
      ),
    );
  }
}
