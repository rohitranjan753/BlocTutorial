import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:blocktutorial/api_bloc_example/post_modell.dart';
import 'package:blocktutorial/api_bloc_example/post_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostLoadedEvent, PostsState> {
  final PostRepo postRepo;

  PostsBloc(this.postRepo) : super(PostsLoadingState()) {
    on<PostLoadedEvent>((event, emit) async {
      try{
        emit(PostsLoadingState());
        var data = await postRepo.getPosts();
        emit(PostLoadedState(data));
      }catch(e){
        emit(PostErrorState(e.toString()));
      }


    });
  }
}
