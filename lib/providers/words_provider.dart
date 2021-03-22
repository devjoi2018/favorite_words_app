import 'package:flutter/cupertino.dart';

class WordsProvider extends ChangeNotifier {
  List<String> _list = [];
  List<bool> _favorite = [];

  get list => this._list;

  set list(List<String> lista) {
    this._list = lista;
    notifyListeners();
  }

  get favorite => this._favorite;

  set favorite(List<bool> favorite) {
    this._favorite = favorite;
    notifyListeners();
  }
}
