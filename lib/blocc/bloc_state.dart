part of 'bloc_bloc.dart';
@immutable
abstract class Counterstate {}

class CounterInitial extends Counterstate {}
class CounterValueChangedState extends Counterstate {
  final int counter;

  CounterValueChangedState({required this.counter});
}
