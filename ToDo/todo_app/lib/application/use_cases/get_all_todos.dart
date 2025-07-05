
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/repository/todo_repo.dart';

class GetAllTodos {
  final TodoRepository repository;

  GetAllTodos(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getAllTodos();
  }
}
