import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/my_string.dart';
import 'package:testapp/second_screen.dart';
import 'package:testapp/theme/theme_provider.dart';

import 'language/language_provider.dart';

class ExtensionScreen extends StatefulWidget {
  const ExtensionScreen({super.key});

  @override
  State<ExtensionScreen> createState() => _ExtensionScreenState();
}

class _ExtensionScreenState extends State<ExtensionScreen> {

  String _myNumber = "Kamlesh 12345 %";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extension Sample'), centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                languageProvider.changeLanguage();
              },),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const Icon(Icons.light_mode),
              onPressed: () {
                themeProvider.setThemeData = !themeProvider.isLightTheme;
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_myNumber, style: TextStyle(fontSize: 36),),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  _formatNumber();
                },
                child: const Text('Format number'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _formatNumber()  {
    setState(() {
      _myNumber = _myNumber.toInt().toString();
    });
  }

}