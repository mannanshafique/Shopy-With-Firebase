import 'dart:ffi';

class Items {
  String title;
  double price;
  String img;
  String desc;

  Items({this.title, this.price, this.img, this.desc});

  String getTitle() {
    return this.title;
  }

  void setTitle(String title) {
    this.title = title;
  }
}
