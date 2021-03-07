import '../../enums/app_enums.dart';

// ignore: public_member_api_docs
class DefaultResponse<T> {
  late final T object;

  final String message;

  ResponseStatus status;

  var object_response;

  bool get success => status == ResponseStatus.Success;
  bool get failed => status == ResponseStatus.Failed;

  // ignore: public_member_api_docs
  DefaultResponse(object,
      {required this.object_response,
      required this.message,
      required this.status});
}
