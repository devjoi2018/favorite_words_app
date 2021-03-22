import 'package:flutter/material.dart';
import 'package:flutter_favorite_words_app/pages/home_page.dart';
import 'package:flutter_favorite_words_app/providers/words_provider.dart';
import 'package:provider/provider.dart';

class FavoriteWordsPage extends StatefulWidget {
  static final routeName = 'favoriteWordsPage';

  @override
  _FavoriteWordsPageState createState() => _FavoriteWordsPageState();
}

class _FavoriteWordsPageState extends State<FavoriteWordsPage> {
  @override
  Widget build(BuildContext context) {
    final _favorite = Provider.of<WordsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('List of favorites words'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _favorite.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(_favorite.list[index]),
                leading: Text(index.toString()),
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
