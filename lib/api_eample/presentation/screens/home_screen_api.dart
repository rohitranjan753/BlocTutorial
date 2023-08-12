import 'package:blocktutorial/api_eample/data/models/PostModel.dart';
import 'package:blocktutorial/api_eample/logic/cubits/post_cubit/post_cubit.dart';
import 'package:blocktutorial/api_eample/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenApi extends StatefulWidget {
  const HomeScreenApi({Key? key}) : super(key: key);

  @override
  State<HomeScreenApi> createState() => _HomeScreenApiState();
}

class _HomeScreenApiState extends State<HomeScreenApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),
      ),
      body: SafeArea(child: BlocConsumer<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostLoadedState) {
            return BuildListItem(state);
          }
          return Center(
            child: Text('AN error occured'),
          );
        }, listener: (BuildContext context, PostState state) {
          if(state is PostErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ERROR')));
          }
      },
      ),

      ),
    );
  }

  ListView BuildListItem(PostLoadedState state) {
    return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                PostModel post = state.posts[index];
                return ListTile(
                  // title: Text(state.posts[index].title.toString()),
                  title: Text(post.title.toString()),
                  subtitle: Text(post.body.toString()),
                );
              });
  }
}
