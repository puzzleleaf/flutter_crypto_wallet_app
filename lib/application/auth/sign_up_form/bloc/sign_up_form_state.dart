part of 'sign_up_form_bloc.dart';

@freezed
abstract class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    @required String emailAddress,
    @required String password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required AuthFailureOrSuccess authFailure,
  }) = _SignUpFormState;

  factory SignUpFormState.initial() => SignUpFormState(
    emailAddress: '',
    password: '',
    showErrorMessages: false,
    isSubmitting: false,
    authFailure: AuthFailureOrSuccess.none(),
  );
}
