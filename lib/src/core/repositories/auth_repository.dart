import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../features/responses/response_builder.dart';
import '../features/responses/response_default.dart';
import '../interfaces/auth_repository_interface.dart';

// ignore: public_member_api_docs
class AuthRepository implements IAuthRepository {
  // ignore: public_member_api_docs
  final FirebaseAuth firebaseAuth;

  // ignore: public_member_api_docs
  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  // ignore: missing_return
  Future<DefaultResponse> doLoginGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();

      final googleSignInAccount = await googleSignIn.signIn();

      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      FirebaseUser firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        final credential = GoogleAuthProvider.getCredential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth
            .signInWithCredential(credential)
            .then((auth) => firebaseUser = auth.user);
      }

      return ResponseBuilder.success<FirebaseUser>(
          object: firebaseUser, message: "Login realizado com sucesso!");
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: "LLLLLL$e");
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      return ResponseBuilder.success<void>(
          object: await firebaseAuth.signOut());
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((auth) {
        return ResponseBuilder.success<FirebaseUser>(object: auth.user);
      });
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
}
