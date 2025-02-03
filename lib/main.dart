import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item.dart';
import 'package:todo_app/widgets/todo_list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyTodoList(),
    );
  }
}

class MyTodoList extends StatefulWidget {
  const MyTodoList({super.key});

  @override
  State<MyTodoList> createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  final List<TodoItem> _todoList = [];

  void _addNewTodo() {
    setState(() {
      _todoList.add(TodoItem(title: 'Item ${_todoList.length + 1}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO list'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'My items. Swipe to delete',
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return TodoListItem(
                  todoItem: _todoList[index],
                  onDismissed: () {
                    setState(() {
                      _todoList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTodo,
        tooltip: 'Add new TODO',
        child: const Icon(Icons.add),
      ),
    );
  }
}
