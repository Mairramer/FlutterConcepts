import '../../enums/app_enums.dart';

// ignore: public_member_api_docs
class DefaultResponse<T> {
  // ignore: public_member_api_docs
  final T object;
  // ignore: public_member_api_docs
  final String message;
  // ignore: public_member_api_docs
  final ResponseStatus status;

  // ignore: public_member_api_docs
  DefaultResponse({this.object, this.message, this.status});
}
