import 'package:hive_ce/hive.dart';
import '../models/todo_model.dart';

class HiveLocalDataSource {
  static const String boxName = 'todosBox';

  Future<Box<TodoModel>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<TodoModel>(boxName);
    }
    return Hive.box<TodoModel>(boxName);
  }

  Future<List<TodoModel>> getAllTodos() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addTodo(TodoModel todo) async {
    final box = await _openBox();
    await box.put(todo.id, todo);
  }

  Future<void> updateTodo(TodoModel todo) async {
    final box = await _openBox();
    await box.put(todo.id, todo);
  }

  Future<void> deleteTodo(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
