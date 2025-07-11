import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
}
