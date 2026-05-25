import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    on<LoginEvent>((event, emit) {
      emit(Authenticated());
    });

    on<LogoutEvent>((event, emit) {
      emit(Unauthenticated());
    });
  }
}
