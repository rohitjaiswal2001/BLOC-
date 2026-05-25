import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/form/form_bloc.dart';
import '../bloc/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Form')),
      body: BlocListener<FormBloc, LoginFormState>(
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            // Log the user in via AuthBloc (BLoC-to-BLoC communication!)
            context.read<AuthBloc>().add(LoginEvent());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Successful!')),
            );
            Navigator.of(context).pop();
          } else if (state.status == FormStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failed'),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email Field
              // buildWhen: Only rebuild this widget when the email field changes
              BlocBuilder<FormBloc, LoginFormState>(
                buildWhen: (previous, current) => previous.email != current.email,
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) =>
                        context.read<FormBloc>().add(EmailChanged(value)),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Password Field
              // buildWhen: Only rebuild this widget when the password field changes
              BlocBuilder<FormBloc, LoginFormState>(
                buildWhen: (previous, current) =>
                    previous.password != current.password,
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) =>
                        context.read<FormBloc>().add(PasswordChanged(value)),
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              // Submit Button - Only rebuilds when status changes
              BlocBuilder<FormBloc, LoginFormState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return state.status == FormStatus.submitting
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            context.read<FormBloc>().add(FormSubmitted());
                          },
                          child: const Text('Submit'),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
