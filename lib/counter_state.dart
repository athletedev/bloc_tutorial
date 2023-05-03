abstract class CounterState {
  final int counterValue;

  CounterState(this.counterValue);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterMinus extends CounterState {
  CounterMinus(super.counterValue);
}

class CounterPlus extends CounterState {
  CounterPlus(super.counterValue);
}
