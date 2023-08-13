import 'package:blocktutorial/example/textexample/text_bloc.dart';
import 'package:blocktutorial/example/textexample/text_event.dart';
import 'package:blocktutorial/example/textexample/text_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextExampleScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  TextExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Example'),
      ),
      body: Column(
        children: [
          BlocBuilder<TextBloc, TextStateNew>(
            builder: (context, state) {
              String textStr = "";
              if (state is TextAfterState) {
                textStr = _controller.text;
              } else if (state is TextErrorState) {
                textStr = state.errorMessage;
              }
              return Text(
                textStr,
                style: TextStyle(fontSize: 30, color: Colors.red),
              );
            },
          ),
          Column(
            children: [
              TextField(
                controller: _controller,
                onChanged: (value) {
                  context
                      .read<TextBloc>()
                      .add(TextNormalEvent(_controller.text));
                },
                decoration: InputDecoration(
                    hintText: 'enter here', border: OutlineInputBorder()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
