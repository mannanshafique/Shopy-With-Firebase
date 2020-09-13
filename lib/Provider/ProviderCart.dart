import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shopy_firebase/Model/Items.dart';

class ProviderCart extends ChangeNotifier {
  List<Items> _items = [];

  double _totalprice = 0.0;

  get totalprice => _totalprice;
  int get count => _items.length;

  void addProduct(Items items) {
    int index = _items.indexWhere((i) => i.id == items.id);
    print(index);
    if (index != -1)
      updateProduct(items, items.quantity + 1);
    else {
      _items.add(items);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(product) {
    int index = _items.indexWhere((i) => i.id == product.id);
    _items[index].quantity = 1;
    _items.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, qty) {
    int index = _items.indexWhere((i) => i.id == product.id);
    _items[index].quantity = qty;
    if (_items[index].quantity == 0) removeProduct(product);
    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    _items.forEach((f) => f.quantity = 1);
    _items = [];
    notifyListeners();
  }

  void calculateTotal() {
    _totalprice = 0;
    _items.forEach((f) {
      _totalprice += f.price * f.quantity;
    });
  }

  // void add(Items item) {
  //   _items.add(item);
  //   _totalprice += item.price;
  //   notifyListeners();

  // }

  // void remove(Items item) {
  //   _items.remove(item);
  //   _totalprice -= item.price;
  //   notifyListeners();
  // }

  // int get count {
  //   return _items.length;
  // }

  // double get totalPrice {
  //   return _totalprice;
  // }

  List<Items> get basketItems {
    return _items;
  }
}
