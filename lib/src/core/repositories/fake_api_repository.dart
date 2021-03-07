// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart' show Dio;
import 'package:flutter_gofast/src/models/fake_api_model.dart';

class FakeApiRepository {
  Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  FakeApiRepository({client}) : dio = client;

  Future<List<FakeApiModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => FakeApiModel.fromJson(json)).toList();
  }
}
