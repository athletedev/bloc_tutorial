import 'package:bloc_course_dev/counter_event.dart';
import 'package:bloc_course_dev/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Bloc<CounterEvent, CounterState> {
  CounterCubit() : super(CounterInitial()) {
    on<CounterIncrement>(
        (event, emit) => emit(CounterPlus(state.counterValue + 1)));
    on<CounterDecrement>(
        (event, emit) => emit(CounterMinus(state.counterValue - 1)));
  }
}
