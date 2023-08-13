import 'package:blocktutorial/example/textexample/text_event.dart';
import 'package:blocktutorial/example/textexample/text_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextBloc extends Bloc<TextEvent,TextStateNew>{
  TextBloc():super(TextInitState()){
   on<TextNormalEvent>((event, emit) {
     if(event.normalValue=='hello'){
       emit(TextErrorState('You typed hello'));
     }
     else{
       emit(TextAfterState(event.normalValue));
     }
   });

  }
}