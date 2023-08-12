import 'package:blocktutorial/routes/second_cubit.dart';
import 'package:blocktutorial/routes/third_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<ThirdCubit, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThirdCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
