import 'package:flutter/material.dart';
import 'package:testapp/health/report_screen.dart';

import 'article_screen.dart';
import 'bottom_navigation_screen.dart';
import 'cupertino_screen.dart';
import 'extension_screen.dart';
import 'first_screen.dart';
import 'listview_screen.dart';
import 'network_screen.dart';

void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TestApp',
        home: HomeScreen(),
      ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Sample'), centerTitle: true,),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()),);
                },
                child: const Text('First Screen'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewScreen(
                    todos: List.generate(
                      5,
                          (i) => Todo(
                        'Todo $i',
                        'A description of what needs to be done for Todo $i',
                      ),
                    ),
                  )),);
                },
                child: const Text('ListView Screen'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkScreen()),);
                },
                child: const Text('Network Screen'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleScreen()),);
                },
                child: const Text('News Article'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExtensionScreen()),);
                },
                child: const Text('Extension Screen'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarExampleApp()),);
                },
                child: const Text('Bottom Navigation'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen()),);
                },
                child: const Text('Health Report'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ActionSheetApp()),);
                },
                child: const Text('Cupertino Controls'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}