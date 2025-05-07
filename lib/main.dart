import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testapp/health/report_screen.dart';
import 'package:testapp/language/language_provider.dart';
import 'package:testapp/login/welcome_screen.dart';
import 'package:testapp/shopper/models/cart.dart';
import 'package:testapp/shopper/models/catalog.dart';
import 'package:testapp/shopper/screens/catalog_screen.dart';
import 'package:testapp/theme/theme_provider.dart';

import 'article_screen.dart';
import 'bottom_navigation_screen.dart';
import 'cupertino_screen.dart';
import 'extension_screen.dart';
import 'first_screen.dart';
import 'listview_screen.dart';
import 'network_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(isLightTheme: true)),
        ChangeNotifierProvider(create: (_) => LanguageProvider(isEnglish: true)),
      ],
      child: HomeApp(),
    ),
  );
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TestApp',
        theme: themeProvider.getThemeData,
        locale: languageProvider.isEnglish ? const Locale('en') : const Locale('ar'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeTitle), centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            icon: const Icon(Icons.light_mode),
            onPressed: () {
              themeProvider.setThemeData = !themeProvider.isLightTheme;
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                languageProvider.changeLanguage();
                },),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()),);
                },
                child: Text(AppLocalizations.of(context)!.firstScreen),
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
                child: Text(AppLocalizations.of(context)!.listView),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkScreen()),);
                },
                child: Text(AppLocalizations.of(context)!.networkScreen),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleScreen()),);
                },
                child: Text(AppLocalizations.of(context)!.newsArticle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExtensionScreen()),);
                },
                child: Text(AppLocalizations.of(context)!.extensionScreen),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarExampleApp()),);
                },
                child: Text(AppLocalizations.of(context)!.bottomNavigationBar),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen()),);
                },
                child: Text(AppLocalizations.of(context)!.healthReport),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ActionSheetApp()),);
                },
                child: Text(AppLocalizations.of(context)!.cupertinoControls),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()),);
                },
                child: Text(AppLocalizations.of(context)!.loginScreen),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogScreen()),);
                },
                child: Text(AppLocalizations.of(context)!.catalogScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}