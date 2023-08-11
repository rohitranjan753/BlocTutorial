import 'package:blocktutorial/sign_in/bloc/signin_bloc.dart';
import 'package:blocktutorial/sign_in/bloc/signin_event.dart';
import 'package:blocktutorial/sign_in/bloc/signin_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInExample extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();


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
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emailController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(_emailController.text, _passController.text));
                },
                decoration: InputDecoration(hintText: 'Email Address'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(_emailController.text, _passController.text));
                },
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if(state is SignInLoadingState){
                    return Center(child: CircularProgressIndicator());
                  }
                  return MaterialButton(onPressed: (){
                    if(state is SignInValidState){
                    BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(_emailController.text, _passController.text));
                    }
                  },child: Text('Sign In'),color: (state is SignInValidState) ?  Colors.blue : Colors.grey,);
                  // if(state is SignInValidState){
                  // return MaterialButton(
                  //   color: Colors.blue,
                  //     onPressed: () {}, child: Text('Sign In'),);
                  // }
                  // else{
                  //   return MaterialButton(
                  //     color: Colors.grey,
                  //     onPressed: () {}, child: Text('Sign In'),);
                  // }
                },
              ),
            ],
          ),
        ));
  }
}
