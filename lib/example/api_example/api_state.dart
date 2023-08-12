import 'package:blocktutorial/example/api_example/api_model.dart';

abstract class ApiState {}

class ApiLoadingState extends ApiState {}

class ApiLoadedState extends ApiState {
  final List<PostsModel> postList;

  ApiLoadedState(this.postList);
}

class ApiErrorState extends ApiState {
  final String errormessage;

  ApiErrorState(this.errormessage);
}
