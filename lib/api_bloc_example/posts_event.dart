//loadingevent, loadedeveent, errorevent

part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
  @override
  List<Object> get props => [];
}

class PostLoadedEvent extends Equatable {
  @override
  List<Object> get props => [];
}
