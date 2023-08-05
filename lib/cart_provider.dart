import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
    final List<Map<String,dynamic>>cartStore =[];

    void addProduct(Map<String,dynamic> prod){
          cartStore.add(prod);
          notifyListeners();
    }

     void removeProduct(Map<String,dynamic> prod){
          cartStore.remove(prod);
          notifyListeners();
    }

}