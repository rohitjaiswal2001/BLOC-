import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/data/data_bloc.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Async Data Fetching'),
        ),
        body: Center(
          child: BlocBuilder<DataBloc, DataState>(
            builder: (context, state) {
              if (state is DataInitial) {
                return const Text('Press the button to fetch data');
              } else if (state is DataLoading) {
                return const CircularProgressIndicator();
              } else if (state is DataLoaded) {
                return Text(
                  state.fetchedData,
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                  textAlign: TextAlign.center,
                );
              } else if (state is DataError) {
                return Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                // Notice we use the context from the Builder here to find the DataBloc
                context.read<DataBloc>().add(FetchDataEvent());
              },
              child: const Icon(Icons.download),
            );
          }
        ),
      ),
    );
  }
}
