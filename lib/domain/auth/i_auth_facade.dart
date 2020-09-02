import 'package:crypto_wallet/domain/auth/firebase_auth_result.dart';
import 'package:flutter/cupertino.dart';

abstract class IAuthFacade {
  Future<void> getSignedInUser();

  Future<FirebaseAuthResult> registerWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  });

  Future<FirebaseAuthResult> signInWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  });

  Future<void> signOut();
}
