

import 'package:flutter_app_2drety/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<Counterstate> {
  CounterCubit() : super(CounterInitial());

  static CounterCubit get(context) => BlocProvider.of(context);
  bool isPass = true;
 
}
