import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure_or_success.freezed.dart';

@freezed
abstract class AuthFailureOrSuccess with _$AuthFailureOrSuccess {
  const factory AuthFailureOrSuccess.none() = None;
  const factory AuthFailureOrSuccess.success() = Success;
  const factory AuthFailureOrSuccess.serverError() = ServerError;
  const factory AuthFailureOrSuccess.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailureOrSuccess.invalidEmailAndPassword() = InvalidEmailAndPassword;
}