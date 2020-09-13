class Items {
  int id;
  String title;
  double price;
  String img;
  String desc;
  int quantity;

  Items({this.title, this.price, this.img, this.desc, this.quantity, this.id});
}

final List<Items> items = [
  Items(
      id: 1,
      title: 'Biryani',
      desc: 'Amazing Tasty biryani ',
      img: 'assets/images/img1.png',
      quantity: 1,
      price: 200),
  Items(
      id: 2,
      quantity: 1,
      title: 'Kabab',
      desc: 'Amazing Tasty Kabab ',
      img: 'assets/images/img3.jpg',
      price: 500),
  Items(
      id: 3,
      quantity: 1,
      title: 'Chapati',
      desc: 'Amazing Tasty Chapati',
      img: 'assets/images/img5.jpg',
      price: 20),
  Items(
      id: 4,
      quantity: 1,
      title: 'Shawarma',
      desc: 'Amazing Tasty Shawarma',
      img: 'assets/images/img6.jpg',
      price: 110),
];
