import '../features/responses/response_default.dart';

// ignore: public_member_api_docs
abstract class IAuthRepository {
  // ignore: public_member_api_docs
  Future<DefaultResponse> doLoginGoogle();
  // ignore: public_member_api_docs
  Future<DefaultResponse> doLoginEmailPassword({String email, String password});
  // ignore: public_member_api_docs
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});
  // ignore: public_member_api_docs
  Future<DefaultResponse> getUser();
  // ignore: public_member_api_docs
  Future<DefaultResponse> logOut();
}
