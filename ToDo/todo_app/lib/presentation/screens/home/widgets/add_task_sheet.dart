import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/presentation/screens/home/bloc/home_bloc.dart';
import 'package:uuid/uuid.dart';

class AddOrEditTaskSheet extends StatefulWidget {
  final Todo? existingTodo;

  const AddOrEditTaskSheet({super.key, this.existingTodo});

  @override
  State<AddOrEditTaskSheet> createState() => _AddOrEditTaskSheetState();
}

class _AddOrEditTaskSheetState extends State<AddOrEditTaskSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  String? _selectedCategory;
  String? _selectedPriority;
  DateTime? _dueDate;

  final List<String> _categories = ['Personal', 'Work', 'Study', 'Health', 'Other'];
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  @override
  void initState() {
    super.initState();
    final t = widget.existingTodo;
    if (t != null) {
      _titleController.text = t.title;
      _descController.text = t.description ?? '';
      _selectedCategory = t.category;
      _selectedPriority = t.priority;
      _dueDate = t.dueDate;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final todo = Todo(
        id: widget.existingTodo?.id ?? const Uuid().v4(),
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        createdAt: widget.existingTodo?.createdAt ?? DateTime.now(),
        dueDate: _dueDate,
        isCompleted: widget.existingTodo?.isCompleted ?? false,
        category: _selectedCategory ?? 'Other',
        priority: _selectedPriority ?? 'Low',
      );

      final bloc = context.read<HomeBloc>();
      if (widget.existingTodo != null) {
        bloc.add(HomeEvent.updateTodo(todo));
      } else {
        bloc.add(HomeEvent.addTodo(todo));
      }

      Navigator.pop(context); // close sheet
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existingTodo != null;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 24,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEdit ? "Edit Task" : "Create Task",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple,
                    ),
              ),
              const SizedBox(height: 24),

              // Title
              TextFormField(
                controller: _titleController,
                decoration: _inputDecoration("Task Title", Icons.title),
                validator: (val) =>
                    (val == null || val.trim().isEmpty) ? 'Title is required' : null,
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: _inputDecoration("Description", Icons.description),
              ),
              const SizedBox(height: 16),

              // Category
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                hint: const Text('Select Category'),
                decoration: _inputDecoration("Category", Icons.category),
                items: _categories
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedCategory = val),
                validator: (val) => val == null ? 'Choose a category' : null,
              ),
              const SizedBox(height: 16),

              // Priority
              DropdownButtonFormField<String>(
                value: _selectedPriority,
                hint: const Text('Select Priority'),
                decoration: _inputDecoration("Priority", Icons.flag),
                items: _priorities
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedPriority = val),
                validator: (val) => val == null ? 'Choose a priority' : null,
              ),
              const SizedBox(height: 16),

              // Due Date
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _dueDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => _dueDate = picked);
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: InputDecorator(
                  decoration: _inputDecoration("Due Date", Icons.calendar_today),
                  child: Text(
                    _dueDate == null
                        ? 'No date selected'
                        : '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _submit,
                  icon: Icon(isEdit ? Icons.check_circle : Icons.add),
                  label: Text(isEdit ? "Update Task" : "Add Task"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
