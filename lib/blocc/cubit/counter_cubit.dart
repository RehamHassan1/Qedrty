import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

/*class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int count=0;
  void CounterM({required String alph, required int ctr}) {
    if (alph == 'a') {
      ctr += 1;
      emit(CounterChangedState());
    } else {
      ctr -= 1;
      emit(CounterChangedState());
    }
  }
}
*/
class CounterCubit extends Cubit<CounterState> {
  // CounterCubit(super.initialState);
  CounterCubit() : super(CounterInc());
  int ctr = 0;
 
  void TeamIncrement({required String team}) {
    if (team == 'A') {
      ctr += 1;
      emit(CounterInc());
    } else {
      ctr -= 1;
      emit(Counterdec());
    }
  }
}
