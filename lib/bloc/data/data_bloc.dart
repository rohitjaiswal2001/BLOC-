import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<FetchDataEvent>((event, emit) async {
      // 1. Tell the UI we are loading
      emit(DataLoading());

      try {
        // 2. Pretend we are fetching data from the internet (wait 2 seconds)
        await Future.delayed(const Duration(seconds: 2));

        // 3. Tell the UI we successfully got the data
        emit(const DataLoaded("Hello, this is secret data from the server!"));
      } catch (e) {
        // 4. Tell the UI something went wrong
        emit(DataError(e.toString()));
      }
    });
  }
}
