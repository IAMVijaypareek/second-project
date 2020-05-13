import 'package:flutter/material.dart';

class Carouselcard extends ChangeNotifier{
 int photoIndex=0;
 int getphotoIndexx() => photoIndex;

void previousImage() {
     photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
     notifyListeners();
  }

  void nextImage() {
   photoIndex = photoIndex < 4 - 1 ? photoIndex + 1 : photoIndex;
   notifyListeners();
  }


}