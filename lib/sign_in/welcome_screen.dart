import 'package:blocktutorial/sign_in/bloc/signin_bloc.dart';
import 'package:blocktutorial/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Column(
        children: [
          Text(
            'Welcome',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        BlocProvider(
                          create: (context) => SignInBloc(),
                          child: SignInExample(),
                        )));
              },
              child: Text('Sign In with email')),
          ElevatedButton(onPressed: () {}, child: Text('Sign In with Google')),
        ],
      ),
    );
  }
}
