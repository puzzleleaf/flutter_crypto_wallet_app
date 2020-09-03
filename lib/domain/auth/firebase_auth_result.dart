import 'package:crypto_wallet/domain/core/result.dart';
import 'package:crypto_wallet/infrastructure/auth/auth_failure_or_success.dart';

class FirebaseAuthResult extends Result {
  final bool isSuccess;
  final AuthFailureOrSuccess authFailureOrSuccess;

  FirebaseAuthResult({
    this.isSuccess,
    this.authFailureOrSuccess,
  });
}
