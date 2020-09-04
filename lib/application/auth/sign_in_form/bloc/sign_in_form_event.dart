part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChange(String email) = EmailChange;
  const factory SignInFormEvent.passwordChange(String password) = PasswordChange;
  const factory SignInFormEvent.signInWithEmailAndPassword() = SignInWithEmailAndPassword;
}