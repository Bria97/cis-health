import 'package:flutter/material.dart';
import 'package:cis_health/Widgets/checklist.dart';


class SingleNotifier extends ChangeNotifier {
  String _singleSymptom = symptoms[0];
  SingleNotifier();

  String get singleSymptom => _singleSymptom;

  updateSymptom(String value) {
    if (value != _singleSymptom) {
      _singleSymptom = value;
      notifyListeners();

      
    }
  }
}
class MultipleNotifier extends ChangeNotifier {
List<String>_selectItems;
MultipleNotifier(this._selectItems);
List<String> get selectedItems = _selectItems;

bool isHaveItem(String value) => _selectItems.contains(value);

addItem(String value) {
  if(!isHaveItem(value)) {
    _selectItems.add(value);
    notifyListeners();
  }
}

removeItem(String value) {
  if (isHaveItem(value)) {
    _selectItems.remove(value);
    notifyListeners();
  }
}
}