
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/repository/todo_repo.dart';
import 'package:todo_app/infrastructure/data/hive_loacal_data_stores.dart';

import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final HiveLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTodo(Todo todo) async {
    final model = TodoModel.fromEntity(todo);
    await localDataSource.addTodo(model);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await localDataSource.deleteTodo(id);
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    final models = await localDataSource.getAllTodos();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final model = TodoModel.fromEntity(todo);
    await localDataSource.updateTodo(model);
  }
}
