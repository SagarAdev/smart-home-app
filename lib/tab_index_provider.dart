import 'package:flutter/material.dart';

class TabIndexProvider with ChangeNotifier{
  int _index = 0;
  int get index => _index;

  void setIndex(int newIndex) {
    _index = newIndex;
    print(_index);
    notifyListeners();
  }
}
