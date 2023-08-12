import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocktutorial/example/api_example/api_event.dart';
import 'package:blocktutorial/example/api_example/api_model.dart';
import 'package:blocktutorial/example/api_example/api_repo.dart';
import 'package:blocktutorial/example/api_example/api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiRepo _apiRepo;

  ApiBloc(this._apiRepo) : super(ApiLoadingState()) {
    on<ApiLoadingEvent>((event, emit) async{
     emit(ApiLoadingState());
     try{
       final users = await _apiRepo.fetchPostApi();
       emit(ApiLoadedState(users));
     }catch(e){
      emit(ApiErrorState(e.toString()));
     }
    });


}}