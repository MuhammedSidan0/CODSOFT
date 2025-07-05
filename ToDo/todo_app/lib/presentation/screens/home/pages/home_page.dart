import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/use_cases/update_todo.dart';
import 'package:todo_app/infrastructure/data/hive_loacal_data_stores.dart';
import 'package:todo_app/infrastructure/repository/todo_repo_impl.dart';
import 'package:todo_app/presentation/screens/home/bloc/home_bloc.dart';
import 'package:todo_app/application/use_cases/get_all_todos.dart';
import 'package:todo_app/application/use_cases/add_todos.dart';
import 'package:todo_app/application/use_cases/delete_todos.dart';
import 'package:todo_app/presentation/screens/home/pages/home_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(
        getAllTodos: GetAllTodos(TodoRepositoryImpl(HiveLocalDataSource())),
        addTodo: AddTodos(TodoRepositoryImpl(HiveLocalDataSource())),
        deleteTodo: DeleteTodos(TodoRepositoryImpl(HiveLocalDataSource())),
        updateTodo: UpdateTodos(TodoRepositoryImpl(HiveLocalDataSource())),
      )..add(const HomeEvent.loadTodos()),
      child: const HomeView(),
    );
  }
}
