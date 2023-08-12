import 'package:blocktutorial/routes/first_cubit.dart';
import 'package:blocktutorial/routes/screens/second_screen.dart';
import 'package:blocktutorial/routes/second_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context,"/second",arguments: {
              "title":"Dynamic Title"
            });

          }, icon: Icon(Icons.arrow_forward_outlined))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<FirstCubit, int>(
            builder: (context, state) {
              return Text(state.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<FirstCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
