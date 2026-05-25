import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Initial state of the counter is 0
  CounterBloc() : super(CounterState(count: 0)) {
    // When IncrementEvent is received, add 1 to the current state
    on<IncrementEvent>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });

    // When DecrementEvent is received, subtract 1 from the current state
    on<DecrementEvent>((event, emit) {
      emit(CounterState(count: state.count - 1));
    });

    // When ResetEvent is received, reset the counter to 0
    on<ResetEvent>((event, emit) {
      emit(CounterState(count: 0));
    });
  }
}
