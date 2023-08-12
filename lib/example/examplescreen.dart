import 'package:blocktutorial/example/example_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Event'),
      ),
      body: Center(
        child: BlocConsumer<ExampleCubit, ExampleCubitState>(
          builder: (context, state) {
            if (state == ExampleCubitState.Gained) {
              return Text(
                'Connected hai Cubit',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              );
            } else if (state == ExampleCubitState.Lost) {
              return Text(
                'Disconnected',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              );
            } else {
              return Text(
                'Disconnected',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              );
            }
          },
          listener: (BuildContext context, ExampleCubitState state) {
            if (state == ExampleCubitState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet gained'),
                backgroundColor: Colors.green,
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet Lost'),
                backgroundColor: Colors.red,
              ));
            }
          },
        ),
      ),
    );
  }
}
