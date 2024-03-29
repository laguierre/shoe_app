import 'package:flutter/material.dart';
import 'package:shoe_app/scr/widgets/custom_widgets.dart';

class ModelShoe with ChangeNotifier {
  String _assetImage = blueShoe;
  double _size = 9.0;

  String get assetImage => _assetImage;

  set assetImage(String value) {
    _assetImage = value;
    notifyListeners();
  }

  double get size => _size;

  set size(double value) {
    _size = value;
    notifyListeners();
  }
}
