part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadTodos() = LoadTodos;
  const factory HomeEvent.addTodo(Todo todo) = AddTodo;
  const factory HomeEvent.deleteTodo(String id) = DeleteTodo;
  const factory HomeEvent.toggleTodo(Todo todo) = ToggleTodo;
  const factory HomeEvent.updateTodo(Todo todo) = UpdateTodo;
}
