import 'package:flutter_gofast/src/core/errors/register_interceptor_error.dart';

import '../../enums/app_enums.dart';
import 'response_default.dart';

// ignore: public_member_api_docs
class ResponseBuilder {
  static DefaultResponse failed<T>(
      {required T object,
      required String message,
      RegisterErrorInterceptor? errorInterceptor}) {
    return DefaultResponse<T>(object,
        object_response: object,
        message: message,
        status: ResponseStatus.Failed);
  }

  static DefaultResponse success<T>(
      {required T object, required String message}) {
    return DefaultResponse<T>(object,
        object_response: object,
        message: message,
        status: ResponseStatus.Success);
  }
}
