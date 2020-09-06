import 'package:flutter/foundation.dart';
import 'package:shopy_firebase/Model/Items.dart';

class ProviderCart extends ChangeNotifier {
  List<Items> _items = [];
  double _totalprice = 0.0;

  void add(Items item) {
    _items.add(item);
    _totalprice += item.price;
    notifyListeners();
  }

  void remove(Items item) {
    _items.remove(item);
    _totalprice -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalprice;
  }

  List<Items> get basketItems {
    return _items;
  }
}
