import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        // BlocListener listens to state changes but DOES NOT rebuild the UI.
        // It is used for "side effects" like showing SnackBars, Dialogs, or navigating.
        child: BlocListener<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.count == 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Wow! You reached 5!')),
              );
            } else if (state.count == -5) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Going negative! You reached -5!')),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              // BlocBuilder listens to changes in CounterBloc and rebuilds only this part of the UI
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Add IncrementEvent to the Bloc
              context.read<CounterBloc>().add(IncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Add DecrementEvent to the Bloc
              context.read<CounterBloc>().add(DecrementEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Add ResetEvent to the Bloc
              context.read<CounterBloc>().add(ResetEvent());
            },
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
