abstract class Counterstate {}

class CounterInitial extends Counterstate {}

abstract class CounterEvent {}

class IncreamentEvent extends CounterEvent {}

class DecreamentEvent extends CounterEvent {}

class ResetEvent extends CounterEvent {}

/*class OrderLoding extends Loginstate {}

class OrderSuccess extends Loginstate {}

class OrderError extends Loginstate {
  final String massage;
  LoginError(this.massage);
}
*/
class CounterValueChangedState extends Counterstate {
  final int counter;

  CounterValueChangedState({required this.counter});
}
