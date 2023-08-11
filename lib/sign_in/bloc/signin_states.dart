//Three states error states, buttondisbaled state and buttonEnabled State

abstract class SignInState{

}
//These three will just use to change colour
class SignInInitialState extends SignInState{}
class SignInValidState extends SignInState{}

//Error state will take data
class SignInErrorState extends SignInState{
  final String errorMessage;

  SignInErrorState(this.errorMessage);

}
//Loading stsate for showing progress indicator
class SignInLoadingState extends SignInState{

}