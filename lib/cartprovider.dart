import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier {
  List<Map<String, dynamic>> travelPlaces = [];
  void addTravelPlace(Map<String, dynamic> travelPlace) {
    travelPlaces.add(travelPlace);
    notifyListeners();
  }

  void removeTravelPlace(Map<String, dynamic> travelPlace) {
    travelPlaces.remove(travelPlace);
    notifyListeners();
  }
}
