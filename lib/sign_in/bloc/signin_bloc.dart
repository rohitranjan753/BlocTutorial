import 'package:blocktutorial/sign_in/bloc/signin_event.dart';
import 'package:blocktutorial/sign_in/bloc/signin_states.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{


  SignInBloc():super(SignInInitialState()){
    on<SignInTextChangedEvent>((event, emit){
      if(EmailValidator.validate(event.emailValue)==false){
        emit(SignInErrorState("Please Enter valid email"));
      }
      else if(event.passwordValue.length<=7){
        emit(SignInErrorState('Please Enter valid password'));
      }
      else{
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit){
      emit(SignInLoadingState());
    });
  }
}