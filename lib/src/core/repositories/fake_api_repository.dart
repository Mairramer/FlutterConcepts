import 'package:dio/dio.dart';
import 'package:flutter_gofast/src/models/fake_api_model.dart';

class FakeApiRepository {
  Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  FakeApiRepository({Dio client}) : dio = client ?? Dio();

  Future<List<FakeApiModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => FakeApiModel.fromJson(json)).toList();
  }
}
