import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/presentation/screens/home/bloc/home_bloc.dart';
import 'package:todo_app/presentation/screens/home/utils/colours_priority.dart';
import 'package:todo_app/presentation/screens/home/utils/dismissible.dart';
import 'package:todo_app/presentation/screens/home/widgets/add_task_sheet.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.todo,
    required this.title,
    required this.desc,
  });

  final Todo todo;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Dismissible(
        key: ValueKey(todo.id),
        direction: DismissDirection.horizontal,
        background: dismissBg(Alignment.centerLeft, Icons.check, Colors.green),
        secondaryBackground:
            dismissBg(Alignment.centerRight, Icons.delete, Colors.redAccent),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            context.read<HomeBloc>().add(HomeEvent.toggleTodo(todo));
          } else {
            context.read<HomeBloc>().add(HomeEvent.deleteTodo(todo.id));
          }
        },
        child: Card(
          color: Colors.white,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & actions row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: todo.isCompleted,
                          onChanged: (_) {
                            context
                                .read<HomeBloc>()
                                .add(HomeEvent.toggleTodo(todo));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blueAccent),
                          onPressed: () {
                            showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<HomeBloc>(), // ✅ Pass the existing bloc to sheet
      child: AddOrEditTaskSheet(existingTodo: todo),
    ),
  );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                         onPressed: () async {
  final confirm = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Delete Task"),
      content: const Text("This action cannot be undone. Are you sure?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );

  if (confirm == true) {
    context.mounted?
    context.read<HomeBloc>().add(HomeEvent.deleteTodo(todo.id)):null;
  }
},

                        ),
                      ],
                    ),
                  ],
                ),

                // Description
                if (desc.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    desc,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      height: 1.4,
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ],

                const SizedBox(height: 12),

                // Bottom row: Due Date (left), Priority + Category (right)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Due date
                    if (todo.dueDate != null)
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 6),
                          Text(
                            '${todo.dueDate!.day}/${todo.dueDate!.month}/${todo.dueDate!.year}',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                    const Spacer(),

                    // Priority tag
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: getPriorityColor(todo.priority).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        todo.priority,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: getPriorityColor(todo.priority),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Category chip
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        todo.category,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.deepPurple.shade700,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
