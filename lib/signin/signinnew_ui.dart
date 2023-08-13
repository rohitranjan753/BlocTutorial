import 'package:blocktutorial/sign_in/bloc/signin_states.dart';
import 'package:blocktutorial/signin/signinnew_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInNewScreen extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignIn'),
        ),
        body: Column(
          children: [
            BlocBuilder<SigninnewBloc, SigninnewState>(
              builder: (context, state) {
                if(state is SignInNewErrorState){
                  return Text(state.errorMessage);
                }
                if(state is SignInShowState){
                  return Text(state.emaiTxt+state.passTxt,style: TextStyle(color: Colors.red,fontSize: 30),);
                }
                return Text('No submit');

              },
            ),

            TextField(
              controller: _email,
              onChanged: (value) {
                BlocProvider.of<SigninnewBloc>(context).add(
                    SignInTextChange(_email.text, _pass.text));
              },
              decoration: InputDecoration(
                  hintText: "Enter EMAIL",
                  border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller: _pass,
              onChanged: (value) {
                BlocProvider.of<SigninnewBloc>(context).add(
                    SignInTextChange(_email.text, _pass.text));
              },
              decoration: InputDecoration(
                  hintText: "Enter Pass",
                  border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(onPressed: () {
              BlocProvider.of<SigninnewBloc>(context).add(
                  SignInTextSubmit(_email.text, _pass.text));
            }, child: Text('Submit')),
          ],
        )

    );
  }
}
