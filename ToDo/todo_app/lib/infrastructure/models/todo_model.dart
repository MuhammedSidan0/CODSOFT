import 'package:hive_ce/hive.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4)
  final DateTime? dueDate;

  @HiveField(5)
  final bool isCompleted;

  @HiveField(6)
  final String category;

  @HiveField(7)
  final String priority;

  TodoModel({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
    this.dueDate,
    required this.isCompleted,
    required this.category,
    required this.priority
  });

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      createdAt: todo.createdAt,
      dueDate: todo.dueDate,
      isCompleted: todo.isCompleted,
      category: todo.category,
      priority: todo.priority
    );
  }

  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      dueDate: dueDate,
      isCompleted: isCompleted,
      category: category,
      priority: priority
    );
  }
}
