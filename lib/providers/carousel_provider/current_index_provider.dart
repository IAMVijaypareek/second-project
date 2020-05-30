import 'package:flutter/foundation.dart';

class Cindex extends ChangeNotifier {
  int _currentindex;
  int getcurrentindex() => _currentindex;
 
  void pagechange(index) {
    _currentindex = index;

    notifyListeners();
  }
}
