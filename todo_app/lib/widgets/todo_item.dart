import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem;

  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TodoColors.cardBg,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: TodoColors.text.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => onToDoChanged(todo),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(
              color: todo.isDone ? TodoColors.success : TodoColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            todo.isDone ? Icons.check : Icons.circle_outlined,
            color: todo.isDone ? TodoColors.success : TodoColors.primary,
          ),
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            color: TodoColors.text,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            decorationColor: TodoColors.textLight,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          color: TodoColors.delete,
          onPressed: () => onDeleteItem(todo.id!),
        ),
      ),
    );
  }
}