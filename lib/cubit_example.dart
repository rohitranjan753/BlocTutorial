import 'package:blocktutorial/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitExample extends StatelessWidget {
  const CubitExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit,InternetState>(builder: (BuildContext context, state) {
            if (state == InternetState.Gained) {
              return Text('Connected!');
            } else if (state == InternetState.Lost) {
              return Text('Not Connected..');
            } else {
              return Text('Not Connected..');
            }
          }, listener: (BuildContext context, Object? state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet Connected'),
                backgroundColor: Colors.green,
              ));
            } else if (state == InternetState.Lost) {
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
