import 'package:flutter_gofast/src/core/repositories/fake_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = FakeApiRepository();
  test('buscar itens', () async {
    final list = await repository.fetchTodos();
    expect(list[0].title, 'delectus aut autem');
  });
}
