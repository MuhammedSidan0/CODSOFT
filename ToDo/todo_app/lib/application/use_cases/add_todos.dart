import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/repository/todo_repo.dart';

class AddTodos {
  final TodoRepository repository;

  AddTodos(this.repository);

  Future<void> call(Todo todo) async {
    await repository.addTodo(todo);
  }
}
