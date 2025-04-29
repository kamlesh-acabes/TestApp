import 'package:flutter/material.dart';

import 'article2_screen.dart';
import 'listview_screen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});
  final String _title = "What Indias Indus Waters Treaty suspension means for Pakistan";
  final String _description = "India has just announced that it will no longer abide by the Indus Waters Treaty of 1960, placing the agreement in  until Pakistan, it claims, credibly and irrevocably renounces cross-border terrorism. This is a potentially historic moment For over 60 years, through wars, near-conflict, and complete diplomatic breakdowns, the treaty endured. Water, unlike so much else in the India-Pakistan relationship, had remained predictable. That predictability is now in question more than it has ever been. The decision potentially marks a turning point in how the two countries manage the most essential shared resource between them. There will be many other discussions in the days ahead that dwell on geopolitics. The goal for this article is simpler: to understand the implications for Pakistan’s rivers, crops, people, and policymakers.What matters most in the days and months ahead is not the threat of a sudden cutoff, but the erosion of reliability of a water system that millions depend on every single day.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Detail")),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      Image.asset("assets/article_image.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _title,
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _description,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal, color: Colors.blueGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _description,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal, color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Article2Screen()),);
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          )
      ),
    );
  }
}