class Items {
  String title;
  double price;
  String img;
  String desc;
  int quantity = 0;

  Items({this.title, this.price, this.img, this.desc, this.quantity});

  String getTitle() {
    return this.title;
  }

  void setTitle(String title) {
    this.title = title;
  }
}

final List<Items> items = [
  Items(
      title: 'Biryani',
      desc: 'Amazing Tasty biryani ',
      img: 'assets/images/img1.png',
      price: 200),
  Items(
      title: 'Kabab',
      desc: 'Amazing Tasty Kabab ',
      img: 'assets/images/img3.jpg',
      price: 500),
  Items(
      title: 'Chapati',
      desc: 'Amazing Tasty Chapati',
      img: 'assets/images/img5.jpg',
      price: 20),
  Items(
      title: 'Shawarma',
      desc: 'Amazing Tasty Shawarma',
      img: 'assets/images/img6.jpg',
      price: 110),
];
