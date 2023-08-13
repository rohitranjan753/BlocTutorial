part of 'signinnew_bloc.dart';

@immutable
abstract class SigninnewEvent {}

class SignInTextChange extends SigninnewEvent{
  final String emaliTxt,passTxt;

  SignInTextChange(this.emaliTxt, this.passTxt);
}
class SignInTextSubmit extends SigninnewEvent{
  final String emaliTxt,passTxt;

  SignInTextSubmit(this.emaliTxt, this.passTxt);
}
