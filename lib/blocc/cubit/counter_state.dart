part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterInc extends CounterState {
  //final int counter;
 // CounterChangedState();
  //CounterChangedState({required this.counter});
}
class Counterdec extends CounterState {}