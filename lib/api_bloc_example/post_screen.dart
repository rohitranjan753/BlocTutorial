import 'package:blocktutorial/api_bloc_example/post_repo.dart';
import 'package:blocktutorial/api_bloc_example/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    context.read<PostsBloc>().add(PostLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.postsModel.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(state.postsModel[index].title.toString()),
                );
              },
            );
          }
          else if (state is PostErrorState) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }


}
