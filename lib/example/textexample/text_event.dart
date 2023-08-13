abstract class TextEvent{}

class TextNormalEvent extends TextEvent{
  final String normalValue;

  TextNormalEvent(this.normalValue);

}
class TextErrorEveent extends TextEvent{
  final String errormessgae;

  TextErrorEveent(this.errormessgae);
}
