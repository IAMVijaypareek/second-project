import 'package:flutter/foundation.dart';

class Cindex extends ChangeNotifier{
 //int index=1;
 // Cindex({this.index});
  int _currentindex;
  int getcurrentindex() => _currentindex;
  void pagechange(index){
    _currentindex = index;
    print("_currentindex is $_currentindex");
     print("index is $index");
    // print("getcurrentindex() is $getcurrentindex");

    notifyListeners();

  }
} 