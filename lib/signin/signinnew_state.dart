part of 'signinnew_bloc.dart';

@immutable
abstract class SigninnewState {}

class SigninnewInitial extends SigninnewState {}
class SignInNewValidState extends SigninnewState {
}
class SignInNewInvalidState extends SigninnewState {
  final String emaiTxt;
  final String passTxt;

  SignInNewInvalidState(this.emaiTxt, this.passTxt);
}
class SignInShowState extends SigninnewState {
  final String emaiTxt;
  final String passTxt;

  SignInShowState(this.emaiTxt, this.passTxt);
}

class SignInNewErrorState extends SigninnewState{
  final String errorMessage;

  SignInNewErrorState(this.errorMessage);

}