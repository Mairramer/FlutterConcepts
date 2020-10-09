import 'package:flutter_gofast/src/core/enums/app_enums.dart';
import 'package:flutter_gofast/src/core/features/responses/response_default.dart';

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
