// loadingstate, loadedstate, errorstate


part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {
}

class PostsLoadingState extends PostsState{}

class PostLoadedState extends PostsState{
  final List<PostModel> postsModel;

  const PostLoadedState(this.postsModel);

  @override
  List<Object> get props => [postsModel];
}
class PostErrorState extends PostsState{
  final String errorMessage;

  const PostErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
