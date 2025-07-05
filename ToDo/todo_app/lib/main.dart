import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/infrastructure/models/todo_model.dart';
import 'package:todo_app/presentation/screens/home/pages/home_page.dart';
import 'package:todo_app/presentation/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<Todo>('todos');

  final prefs = await SharedPreferences.getInstance();
  final hasUsername = prefs.containsKey('username');

  runApp(MyApp(showWelcome: !hasUsername));
}

class MyApp extends StatelessWidget {
  final bool showWelcome;

  const MyApp({super.key,  this.showWelcome=true});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: showWelcome ? const WelcomeScreen() : const HomePage(),
    );
  }
}
