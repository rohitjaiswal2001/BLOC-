part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final String fetchedData;

  const DataLoaded(this.fetchedData);

  @override
  List<Object> get props => [fetchedData];
}

class DataError extends DataState {
  final String message;

  const DataError(this.message);

  @override
  List<Object> get props => [message];
}
