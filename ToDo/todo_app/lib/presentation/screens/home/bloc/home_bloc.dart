import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/application/use_cases/update_todo.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/application/use_cases/get_all_todos.dart';
import 'package:todo_app/application/use_cases/add_todos.dart';
import 'package:todo_app/application/use_cases/delete_todos.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllTodos getAllTodos;
  final AddTodos addTodo;
  final DeleteTodos deleteTodo;
  final UpdateTodos updateTodo;

  HomeBloc({
    required this.getAllTodos,
    required this.addTodo,
    required this.deleteTodo,
    required this.updateTodo,
  }) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      // Use regular Dart type-checking instead of .map()
      if (event is LoadTodos) {
        emit(const HomeState.loading());
        try {
          final todos = await getAllTodos();
          emit(HomeState.loaded(todos));
        } catch (e) {
          emit(HomeState.error('Failed to load todos'));
        }
      } else if (event is AddTodo) {
        try {
          await addTodo(event.todo);
          final todos = await getAllTodos();
          emit(HomeState.loaded(todos));
        } catch (e) {
          emit(HomeState.error('Failed to add todo'));
        }
      } else if (event is DeleteTodo) {
        try {
          await deleteTodo(event.id);
          final todos = await getAllTodos();
          emit(HomeState.loaded(todos));
        } catch (e) {
          emit(HomeState.error('Failed to delete todo'));
        }
      } else if (event is ToggleTodo) {
        try {
          final updated = event.todo.copyWith(
            isCompleted: !event.todo.isCompleted,
          );
          await updateTodo(updated);
          final todos = await getAllTodos();
          emit(HomeState.loaded(todos));
        } catch (e) {
          emit(HomeState.error('Failed to toggle task'));
        }
      } else if (event is UpdateTodo) {
        try {
          await updateTodo(event.todo);
          final todos = await getAllTodos();
          emit(HomeState.loaded(todos));
        } catch (_) {
          emit(const HomeState.error('Failed to update todo'));
        }
      }
    });
  }
}
