import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(isDecremented: false, isIncremented: false, value: 0)) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementCounterEvent) {
        _incrementCounter(emit);
      } else if (event is DecrementCounterEvent) {
        _decrementCounter(emit);
      }
    });
  }

  void _incrementCounter(Emitter<CounterState> emit) {
    emit(state.copyWith(value: state.value + 1, isIncremented: true, isDecremented: false));
  }

  void _decrementCounter(Emitter emit) {
    emit(state.copyWith(value: state.value - 1, isDecremented: true, isIncremented: false));
  }
}
