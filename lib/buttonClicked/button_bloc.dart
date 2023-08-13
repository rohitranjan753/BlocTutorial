
import 'package:blocktutorial/buttonClicked/button_event.dart';
import 'package:blocktutorial/buttonClicked/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonBloc extends Bloc<ButtonEvent,TextState>{

  ButtonBloc():super(TextInitialState()){

    on<RedButtonEvent>((event, emit) => emit(TextRedState()));
    on<GreenButtonEvent>((event, emit) => emit(TextGreenState()));
  }
}