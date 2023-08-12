import 'package:blocktutorial/example/examplestate.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

enum ExampleCubitState{
  Initial, Lost, Gained
}

class ExampleCubit extends Cubit<ExampleCubitState>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;

  ExampleCubit() : super(ExampleCubitState.Initial){
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.wifi || event == ConnectivityResult.mobile){
        emit(ExampleCubitState.Gained);
      }
      else{
        emit(ExampleCubitState.Lost);
      }
    });


  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}