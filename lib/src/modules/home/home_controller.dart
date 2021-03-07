import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/enums/home_state_enums.dart';
import 'package:flutter_gofast/src/core/repositories/fake_api_repository.dart';
import 'package:flutter_gofast/src/models/fake_api_model.dart';

class HomeController {
  List<FakeApiModel> todos = [];
  final FakeApiRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.success);

  HomeController({repository}) : _repository = repository;

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

  success() {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          var todo = todos[index];
          return Card(
            shadowColor: Colors.black87,
            elevation: 10,
            child: ListTile(
              title: Text(todo.title!),
            ),
          );
        });
  }

  error() {
    return Center(
      child: ElevatedButton(
          child: Text("Tente Novamente"),
          onPressed: () {
            start();
          }),
    );
  }

  loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  stateManage(HomeState state) {
    switch (state) {
      case HomeState.start:
        return start();
      case HomeState.loading:
        return loading();
      case HomeState.success:
        return success();
      case HomeState.error:
        return error();
      default:
        return start();
    }
  }
}
