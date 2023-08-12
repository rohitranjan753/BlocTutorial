import 'dart:async';
import 'package:blocktutorial/example/exampleevent.dart';
import 'package:blocktutorial/example/examplestate.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;

  ExampleBloc():super(ExampleInitialState()){
    on<ExampleLostEvent>((event, emit) => emit(ExampleLossState()));
    on<ExampleGainedEvent>((event, emit) => emit(ExampleGainedState()));

    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile || event == ConnectivityResult.wifi){
        add(ExampleGainedEvent());
      }
      else{
        add(ExampleLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
