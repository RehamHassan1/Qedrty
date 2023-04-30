import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'bloc_event.dart';
part 'bloc_state.dart';

class CounterBloc extends Bloc<CounterEvent, Counterstate> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncreamentEvent) {
        counter = counter + 1;
        emit(CounterValueChangedState(counter: counter));
      } else if (event is DecreamentEvent) {
         counter = counter - 1;
        emit(CounterValueChangedState(counter: counter));
      } else {
         counter = 0;
        emit(CounterValueChangedState(counter: counter));
      }
    });
  }
}
