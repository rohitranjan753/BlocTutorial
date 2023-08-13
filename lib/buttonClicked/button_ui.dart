import 'package:blocktutorial/buttonClicked/button_bloc.dart';
import 'package:blocktutorial/buttonClicked/button_event.dart';
import 'package:blocktutorial/buttonClicked/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonChange extends StatelessWidget {
  const ButtonChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Event'),
      ),
      body: Column(
        children: [
          BlocBuilder<ButtonBloc, TextState>(builder: (context, state) {
            Color containerColor = Colors.grey;
            String textString = "Default";
            Color textColor = Colors.black;
            if (state is TextRedState) {
              containerColor = Colors.red;
              textString = "RED";
              textColor = Colors.white;
            } else if (state is TextGreenState) {
              containerColor = Colors.green;
              textString = "GREEN";
              textColor = Colors.blue;
            }

            return Container(
              height: 200,
              width: 200,
              child: Text(textString,style: TextStyle(color: textColor),),
              color: containerColor,
            );
          }),
          ElevatedButton(
              onPressed: () {
                context.read<ButtonBloc>().add(RedButtonEvent());
              },
              child: Text('Red')),
          ElevatedButton(
              onPressed: () {
                context.read<ButtonBloc>().add(GreenButtonEvent());
              },
              child: Text('Green')),
        ],
      ),
    );
  }
}
