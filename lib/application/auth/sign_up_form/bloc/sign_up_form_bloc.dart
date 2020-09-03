import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/auth/i_auth_facade.dart';
import 'package:crypto_wallet/domain/core/value_validators.dart';
import 'package:crypto_wallet/infrastructure/auth/auth_failure_or_success.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_up_form_event.dart';

part 'sign_up_form_state.dart';

part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;

  SignUpFormBloc(this._authFacade) : super(SignUpFormState.initial());

  @override
  Stream<SignUpFormState> mapEventToState(
    SignUpFormEvent event,
  ) async* {
    yield* event.map(
      emailChange: (e) async* {
        yield state.copyWith(
          emailAddress: e.email,
          authFailureOrSuccess: AuthFailureOrSuccess.none(),
        );
      },
      passwordChange: (e) async* {
        yield state.copyWith(
          password: e.password,
          authFailureOrSuccess: AuthFailureOrSuccess.none(),
        );
      },
      registerWithEmailAndPassword: (e) async* {
        final String email = state.emailAddress;
        final String password = state.password;

        if (validateEmailAddress(email) && validatePassword(password)) {
          yield state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            authFailureOrSuccess: AuthFailureOrSuccess.none(),
          );

          var result = await _authFacade.registerWithEmailAndPassword(
              emailAddress: email, password: password);

          yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: result.authFailureOrSuccess,
          );
        } else {
          yield state.copyWith(
            showErrorMessages: true,
            authFailureOrSuccess: AuthFailureOrSuccess.none(),
          );
        }
      },
    );
  }
}
