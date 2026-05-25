part of 'form_bloc.dart';

enum FormStatus { initial, submitting, success, failure }

// Renamed to LoginFormState to avoid clash with Flutter's built-in FormState
class LoginFormState extends Equatable {
  final String email;
  final String password;
  final FormStatus status;
  final String? errorMessage;

  const LoginFormState({
    this.email = '',
    this.password = '',
    this.status = FormStatus.initial,
    this.errorMessage,
  });

  LoginFormState copyWith({
    String? email,
    String? password,
    FormStatus? status,
    String? errorMessage,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}
