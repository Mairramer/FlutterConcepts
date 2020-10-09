import '../../enums/app_enums.dart';
import 'response_default.dart';

// ignore: public_member_api_docs
class ResponseBuilder {
  static DefaultResponse failed<T>({T object, String message}) {
    return DefaultResponse<T>(
        object: object, message: message, status: ResponseStatus.Failed);
  }

  static DefaultResponse success<T>({T object, String message}) {
    return DefaultResponse<T>(
        object: object, message: message, status: ResponseStatus.Success);
  }
}