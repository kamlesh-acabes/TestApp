import 'package:flutter/material.dart';

import 'detail_screen.dart';

class Todo {
  final String title;
  final String description;
  const Todo(this.title, this.description);
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key, required this.todos});
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              _navigateToDetailScreen(context, todos[index]);
            }
          );
        },
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context, Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(todo: todo),
      ),);
  }
}

