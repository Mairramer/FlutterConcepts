import 'package:flutter_gofast/src/core/features/responses/response_default.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> doLoginGoogle();
  Future<DefaultResponse> doLoginEmailPassword({String email, String password});
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});
  Future<DefaultResponse> getUser();
  Future<DefaultResponse> logOut();
}
