import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({
    super.key,
    required this.todoItem,
    required this.onDismissed,
  });

  final TodoItem todoItem;
  final void Function() onDismissed;

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.todoItem.id),
      onDismissed: (direction) {
        widget.onDismissed();
      },
      child: ListTile(
        leading: const Icon(Icons.drag_indicator),
        title: Text(widget.todoItem.title),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.todoItem.isDone = !widget.todoItem.isDone;
            });
          },
          icon: Icon(widget.todoItem.isDone
              ? Icons.check_box
              : Icons.check_box_outline_blank),
        ),
      ),
    );
  }
}
