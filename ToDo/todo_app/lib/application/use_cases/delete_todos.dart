
import 'package:todo_app/domain/repository/todo_repo.dart';

class DeleteTodos {
  final TodoRepository repository;

  DeleteTodos(this.repository);

  Future<void> call(String id) async {
    await repository.deleteTodo(id);
  }
}
