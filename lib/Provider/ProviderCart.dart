import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shopy_firebase/Model/Items.dart';

class ProviderCart extends ChangeNotifier {
  List<Items> _items = [];
  double _totalprice = 0.0;

//   Map<String , Items> _items = {};

//   Map<String , Items> get items{
//     return {..._items};
//   }

// int get count {
//     return _items.length;
//   }

//   void add(Items items) {
//     if (_items.containsKey(items.title)) {
//       _items.update(
//           items.title,
//           (existingCartItem) => Items(
//               desc: existingCartItem.desc,
//               img: existingCartItem.img,
//               title: existingCartItem.title,
//               quantity: existingCartItem.quantity + 1,
//               price: existingCartItem.price));
//     } else {
//       _items.putIfAbsent(
//           items.title,
//           () => Items(
//                 desc: items.desc,
//                 img: items.img,
//                 title: items.title,
//                 quantity: 1,
//                 price: items.price,
//               ));
//     }
//     notifyListeners();
//   }

//   void remove(Items items) {
//     _items.remove(items);
//     notifyListeners();
//   }

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
