import 'package:crypto_wallet/domain/auth/i_auth_facade.dart';
import 'package:crypto_wallet/domain/core/value_validators.dart';
import 'package:crypto_wallet/infrastructure/auth/auth_failure_or_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_form_event.dart';

part 'sign_up_form_state.dart';

part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;

  SignUpFormBloc(this._authFacade) : super(SignUpFormState.initial());

  @override
  Stream<SignUpFormState> mapEventToState(SignUpFormEvent event) async* {
    yield* event.map(
      emailChange: (event) async* {
        yield state.copyWith(
          emailAddress: event.email,
          authFailureOrSuccess: AuthFailureOrSuccess.none(),
        );
      },
      passwordChange: (event) async* {
        yield state.copyWith(
          password: event.password,
          authFailureOrSuccess: AuthFailureOrSuccess.none(),
        );
      },
      registerWithEmailAndPassword: (event) async* {
        final String email = state.emailAddress;
        final String password = state.password;

        if (validateEmailAddress(email) && validatePassword(password)) {
          yield state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            authFailureOrSuccess: AuthFailureOrSuccess.none(),
          );

          var result = await _authFacade.registerWithEmailAndPassword(
            emailAddress: email,
            password: password,
          );

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
