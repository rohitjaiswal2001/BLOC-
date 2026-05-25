part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;

  const CounterState({required this.count});

  @override
  List<Object> get props => [count];
}
