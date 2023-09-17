import 'package:flutter/material.dart';



//this classs will provide change and notify the listeners it uses the ChangeNotifier mixin(copy and paste)
class CounterModel with ChangeNotifier{
  int _counter = 0;
  void increment(){
    _counter++;
    notifyListeners();

  }

  void decrement(){
    _counter--;
    notifyListeners();
  }

  int get counter => _counter;
}
