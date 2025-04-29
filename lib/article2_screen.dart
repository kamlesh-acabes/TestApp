import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'listview_screen.dart';

class Article2Screen extends StatefulWidget {
  const Article2Screen({super.key});

  @override
  State<Article2Screen> createState() => _Article2ScreenState();
}

class _Article2ScreenState extends State<Article2Screen> {

  List<Todo>? todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos'),
      leading: Icon(Icons.arrow_back_outlined),),
      body: SafeArea(
        child: todos == null ? Center(child: const CircularProgressIndicator()) : ListView.builder(
          itemCount: todos!.length,
          itemBuilder: (context, index) {
            return _buildListView(context, todos![index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () {
            _generateListItem();
      }),
    );
  }

  Widget _buildListView(BuildContext context, Todo todo) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description),
        onTap: () {
          _navigateToDetailScreen(context, todo);
        }),
    );
  }

  void _generateListItem() {
    todos = List.generate(
      30,
          (i) => Todo(
        'Article Title $i',
        'A description of what needs to be done for Article with long text or we can say multiline text $i',
      ),
    );
    setState(() {});
  }

  void _navigateToDetailScreen(BuildContext context, Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(todo: todo),
      ),);
  }
}

