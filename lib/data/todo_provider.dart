import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo_model.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(String title) {
    state = [...state, Todo(id: DateTime.now().toString(), title: title)];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo..completed = !todo.completed else todo
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});
