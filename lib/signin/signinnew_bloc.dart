import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'signinnew_event.dart';
part 'signinnew_state.dart';

class SigninnewBloc extends Bloc<SigninnewEvent, SigninnewState> {
  SigninnewBloc() : super(SigninnewInitial()) {
    on<SignInTextChange>((event, emit) {
      if(EmailValidator.validate(event.emaliTxt) == false){
        emit(SignInNewErrorState('Email is wrong'));
      }
      else if(event.passTxt.length <=7){
        emit(SignInNewErrorState('Passwword length is wrong'));
      }
      else{
        emit(SignInNewValidState());
      }
    });

    on<SignInTextSubmit>((event, emit) => emit(SignInShowState(event.emaliTxt,event.passTxt)));
  }
}
