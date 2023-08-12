import 'package:blocktutorial/api_eample/data/models/PostModel.dart';
import 'package:blocktutorial/api_eample/logic/cubits/post_cubit/post_state.dart';
import 'package:blocktutorial/api_eample/repositories/pots_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPost();
  }

  PostRepository postRepository = PostRepository();

  void fetchPost() async {
    try {
      List<PostModel> posts = await postRepository.fetchPost();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
