import 'package:flutter/material.dart';
import 'package:flutter_favorite_words_app/pages/favorite_words_page.dart';
import 'package:flutter_favorite_words_app/pages/home_page.dart';
import 'package:flutter_favorite_words_app/providers/words_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite words',
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoriteWordsPage.routeName: (context) => FavoriteWordsPage(),
        },
      ),
    );
  }
}
