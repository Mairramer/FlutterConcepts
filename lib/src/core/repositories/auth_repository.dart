// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gofast/src/core/errors/register_interceptor_error.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_sign_in/google_sign_in.dart';

import '../features/responses/response_builder.dart';
import '../features/responses/response_default.dart';
import '../interfaces/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String? email, String? password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email!.trim(), password: password!.trim());

      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser as FirebaseUser,
          message: 'Sucesso!');
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> doLoginGoogle() async {
    try {
      var googleSignIn = GoogleSignIn();

      var googleSignInAccount = await googleSignIn.signIn();

      var googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      FirebaseUser? firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        var credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth.signInWithCredential(credential).then((auth) {
          firebaseUser = auth.user as FirebaseUser?;
        });
      }
      return ResponseBuilder.success<FirebaseUser>(
          object: firebaseUser!, message: 'Logou com sucesso');
    } catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: 'Falha ao Logar com Google. e: ${e.toString()}',
          errorInterceptor: RegisterErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser as FirebaseUser,
          message: 'Bem Vindo');
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: RegisterErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success(message: 'Até Mais', object: null);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String? email, String? password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email!.trim(), password: password!.trim())
          .then(
        (auth) {
          return ResponseBuilder.success<FirebaseUser>(
              object: auth.user as FirebaseUser, message: 'Successo!');
        },
      );
    } catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: RegisterErrorInterceptor());
    }
  }
}

mixin FirebaseUser {}
