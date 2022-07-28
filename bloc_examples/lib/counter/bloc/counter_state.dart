part of 'counter_bloc.dart';

class CounterState {
  final int value;
  final bool isIncremented;
  final bool isDecremented;
  CounterState({
    required this.value,
    required this.isIncremented,
    required this.isDecremented,
  });

  CounterState copyWith({
    int? value,
    bool? isIncremented,
    bool? isDecremented,
  }) {
    return CounterState(
      value: value ?? this.value,
      isIncremented: isIncremented ?? this.isIncremented,
      isDecremented: isDecremented ?? this.isDecremented,
    );
  }
}
