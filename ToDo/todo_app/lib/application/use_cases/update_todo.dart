import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/repository/todo_repo.dart';

class UpdateTodos {
  final TodoRepository repo;

  UpdateTodos(this.repo);

  Future call(Todo todo) async {
    return repo.updateTodo(todo);
  }
}
