import 'package:flutter/material.dart';

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
  final List<String> _todoList = [];
  final List<bool> _todoListChecked = [];

  void _incrementCounter() {
    setState(() {
      _todoList.add('Item ${_todoList.length + 1}');
      _todoListChecked.add(false);
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
                return Dismissible(
                  key: ValueKey(_todoList[index]),
                  onDismissed: (direction) => setState(() {
                    _todoList.removeAt(index);
                    _todoListChecked.removeAt(index);
                  }),
                  child: ListTile(
                    leading: const Icon(Icons.drag_indicator),
                    title: Text(_todoList[index]),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          _todoListChecked[index] = !_todoListChecked[index];
                        });
                      },
                      icon: Icon(_todoListChecked[index]
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
