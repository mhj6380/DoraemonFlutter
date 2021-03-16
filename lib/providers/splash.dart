// SPLASH PROVIDER
import 'package:flutter/foundation.dart';

class Splash with ChangeNotifier {
  int _bottomNaviFocus = 0;
 
  int getBottomNaviFocus()=> _bottomNaviFocus;

  void changeBottomNaiveFocus(int path){
    _bottomNaviFocus = path;
    notifyListeners();
  }
} 