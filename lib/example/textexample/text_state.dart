abstract class TextStateNew{}

class TextInitState extends TextStateNew{}

class TextAfterState extends TextStateNew{
  final String value;
  TextAfterState(this.value);
}
class TextErrorState extends TextStateNew{
  final String errorMessage;

  TextErrorState(this.errorMessage);
}