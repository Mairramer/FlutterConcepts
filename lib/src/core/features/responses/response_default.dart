import '../../enums/app_enums.dart';

// ignore: public_member_api_docs
class DefaultResponse<T> {
  final T object;

  final String message;

  ResponseStatus status;

  bool get success => status == ResponseStatus.Success;
  bool get failed => status == ResponseStatus.Failed;

  // ignore: public_member_api_docs
  DefaultResponse({this.object, this.message, this.status});
}
