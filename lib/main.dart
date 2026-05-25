import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter/counter_bloc.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/form/form_bloc.dart';
import 'page/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider allows us to provide multiple Blocs to the widget tree
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<FormBloc>(
          create: (context) => FormBloc(),
        ),

        // CounterBloc needs AuthBloc as a dependency, so we read it from the context
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(authBloc: context.read<AuthBloc>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter BLoC Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'BLoC Counter Page'),
      ),
    );
  }
}
