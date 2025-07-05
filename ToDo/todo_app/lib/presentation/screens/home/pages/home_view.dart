import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_app/presentation/screens/home/bloc/home_bloc.dart';

import 'package:todo_app/presentation/screens/home/widgets/add_task_sheet.dart';
import 'package:todo_app/core/extensions/string_extensions.dart';
import 'package:todo_app/presentation/screens/home/widgets/task_card.dart';

String _formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

    Future<String> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadUsername(),
      builder: (context, snapshot) {
        final username = snapshot.data ?? '...';
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final bloc = context.read<HomeBloc>(); // Capture current bloc
        
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder:
                    (ctx) => BlocProvider.value(
                      value: bloc,
                      child: const AddOrEditTaskSheet(),
                    ),
              );
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.deepPurple,
            child: const Icon(Icons.add),
          ),
        
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting
                     Text(
                      "Hi, ${username.capitalize()}",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
        
                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          icon: Icon(Icons.search, color: Colors.white70),
                          hintText: 'Search your task...',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
        
                    // Stats Placeholder
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is Loaded) {
                            final todos = state.todos;
                            final total = todos.length;
                            final done = todos.where((t) => t.isCompleted).length;
                            final pending = total - done;
        
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _StatItem(label: 'Total', value: '$total'),
                                _StatItem(label: 'Done', value: '$done'),
                                _StatItem(label: 'Pending', value: '$pending'),
                              ],
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white70,
                                strokeWidth: 3,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
        
                    // Task List
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is Loaded && state.todos.isNotEmpty) {
                          return const Text(
                            "Your Tasks",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                    const SizedBox(height: 12),
        
                    Expanded(
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return switch (state) {
                            Initial() => const Center(
                              child: Text(
                                'Initializing...',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Loading() => const Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            ),
                            Loaded(:final todos) =>
                              todos.isEmpty
                                  ? const Center(
                                    child: Text(
                                      "No tasks found.",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                  : ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
        final todo = todos[index];
        
        final title = todo.title.trim().capitalize();
        final desc = (todo.description ?? '').trim().capitalize();
        
        return TaskCardWidget(todo: todo, title: title, desc: desc);
          },
        ),
           Error(:final message) => Center(
                              child: Text(
                                "Error: $message",
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          };
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  
 

}


// Custom stat item
class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}
