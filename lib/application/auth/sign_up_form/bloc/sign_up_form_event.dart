part of 'sign_up_form_bloc.dart';

@freezed
abstract class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.emailChange(String email) = EmailChange;
  const factory SignUpFormEvent.passwordChange(String password) = PasswordChange;
  const factory SignUpFormEvent.registerWithEmailAndPassword() = RegisterWithEmailAndPassword;
}