import 'package:flutter/material.dart';
import 'package:flutter_favorite_words_app/pages/favorite_words_page.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_favorite_words_app/providers/words_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _listOfWords = [];

  @override
  void didChangeDependencies() {
    final _favorite = Provider.of<WordsProvider>(context, listen: false);

    nouns.take(50).forEach((item) {
      _listOfWords.add(item);
      _favorite.favorite.add(false);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _favorite = Provider.of<WordsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Words'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context, FavoriteWordsPage.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _listOfWords.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8.0,
              child: ListTile(
                title: Text(_listOfWords[index]),
                leading: Text(index.toString()),
                trailing: IconButton(
                  icon: _favorite.favorite[index] == false
                      ? Icon(Icons.favorite_border)
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  onPressed: () {
                    if (_favorite.favorite[index] == false) {
                      _favorite.favorite[index] = true;
                      _favorite.list.add(_listOfWords[index].toString());
                    } else if (_favorite.favorite[index] == true) {
                      _favorite.favorite[index] = false;
                      _favorite.list.remove(_listOfWords[index].toString());
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
