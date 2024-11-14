import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo App',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListTile(title: Text(tasks[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    // Prompt user to enter a task
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Task'),
        content: TextField(controller: controller),
        actions: [
          MaterialButton(
            child: const Text('Add'),
            onPressed: () {
              setState(() {
                tasks.add(controller.text);
                controller.clear();
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}