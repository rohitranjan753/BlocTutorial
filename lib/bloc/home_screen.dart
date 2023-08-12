import 'package:blocktutorial/bloc/internet_bloc.dart';
import 'package:blocktutorial/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc,InternetState>(builder: (BuildContext context, state) {
            if (state is InternetGainedState) {
              return Text('Connected!');
            } else if (state is InternetLossState) {
              return Text('Not Connected..');
            } else {
              return Text('Not Connected..');
            }
          }, listener: (BuildContext context, Object? state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet Connected'),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLossState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Internet LOST'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
