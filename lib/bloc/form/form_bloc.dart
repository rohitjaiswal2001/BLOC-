import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, LoginFormState> {
  FormBloc() : super(const LoginFormState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<FormSubmitted>((event, emit) async {
      // Basic validation
      if (state.email.isEmpty || !state.email.contains('@')) {
        emit(
          state.copyWith(
            status: FormStatus.failure,
            errorMessage: 'Please enter a valid email address.',
          ),
        );
        return;
      }

      if (state.password.length < 6) {
        emit(
          state.copyWith(
            status: FormStatus.failure,
            errorMessage: 'Password must be at least 6 characters.',
          ),
        );
        return;
      }

      // If valid, start submitting
      emit(state.copyWith(status: FormStatus.submitting));

      // Simulate network request
      await Future.delayed(const Duration(seconds: 2));

      // Simulate a successful login
      emit(state.copyWith(status: FormStatus.success));
    });
  }
}
