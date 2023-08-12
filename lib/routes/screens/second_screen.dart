import 'package:blocktutorial/routes/screens/third_screen.dart';
import 'package:blocktutorial/routes/second_cubit.dart';
import 'package:blocktutorial/routes/third_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  const SecondScreen({Key? key,required this.title});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, "/third");
          }, icon: Icon(Icons.arrow_forward_outlined))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<SecondCubit, int>(
            builder: (context, state) {
              return Text(state.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),);
            },
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<SecondCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
