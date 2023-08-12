import 'package:blocktutorial/example/api_example/api_bloc.dart';
import 'package:blocktutorial/example/api_example/api_event.dart';
import 'package:blocktutorial/example/api_example/api_model.dart';
import 'package:blocktutorial/example/api_example/api_repo.dart';
import 'package:blocktutorial/example/api_example/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(
        RepositoryProvider.of<ApiRepo>(context),
      )..add(ApiLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ui'),
        ),
        body: BlocBuilder<ApiBloc, ApiState>(
          builder: (BuildContext context, ApiState state) {
            if (state is ApiLoadingState) {
              return CircularProgressIndicator();
            } else if (state is ApiLoadedState) {
              List<PostsModel> list = state.postList;

              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(list[index].title.toString()),
                    );
                  });
            } else {
              return Text('Error');
            }
          },
        ),
      ),
    );
  }
}
