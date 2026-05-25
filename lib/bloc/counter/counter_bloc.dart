import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../auth/auth_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final AuthBloc authBloc;
  late final StreamSubscription authSubscription;

  // Initial state of the counter is 0
  CounterBloc({required this.authBloc}) : super(const CounterState(count: 0)) {
    
    // Listen to AuthBloc state changes
    authSubscription = authBloc.stream.listen((authState) {
      if (authState is Unauthenticated) {
        // If user logs out, dispatch a ResetEvent to ourselves
        add(ResetEvent());
      }
    });

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
      emit(const CounterState(count: 0));
    });
  }

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }
}
