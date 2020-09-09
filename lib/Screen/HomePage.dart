import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_firebase/Model/Items.dart';
import 'package:shopy_firebase/Provider/ProviderCart.dart';
import 'package:shopy_firebase/Screen/CheckOutScreen.dart';
import 'package:shopy_firebase/Screen/DetailScreen.dart';
import 'package:shopy_firebase/SearchDelegate/searchDelegate.dart';
import 'package:shopy_firebase/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<ProviderCart>(
      builder: (context, providerCart, child) {
        return Scaffold(
          key: _scaffoldKey, //drawer
          drawer: _drawer(context, providerCart.count.toString()),
          // backgroundColor: Colors.grey[200],
          appBar: _appbar(providerCart, context, () {
            _scaffoldKey.currentState.openDrawer();
          }),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfffbfbfb),
                    Color(0xfff7f7f7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Lets Eat!',
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.local_bar)
                    ],
                  ),
                  //height: MediaQuery.of(context).size.height * 0.3,
                  _accentCard(),
                  Text(
                    'What are you craving?',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  SizedBox(
                      height: 130,
                      // width: width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 40,
                          itemBuilder: (context, index) {
                            return _categories();
                          })),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: height * 0.4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return _popularRes(context, items[index]);
                        }),
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }

  Widget _appbar(
      ProviderCart providerCart, BuildContext context, Function function) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: CustomWidgets().iconButton(Icons.search, () {
              showSearch(context: context, delegate: Searching(items));
            }, '')),
        Padding(
            padding: EdgeInsets.only(right: 12, top: 10),
            child: CustomWidgets().iconButton(Icons.shopping_cart, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckOutScreen()));
            }, providerCart.count.toString())),
        SizedBox(
          width: 4,
        )
      ],
      leading: Padding(
        padding: EdgeInsets.only(top: 10, left: 3),
        child: CustomWidgets().iconButton(Icons.person, () {
          function();
        }, ''),
      ),
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Delivering to',
            style: TextStyle(color: blackColor, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Shoreditch',
                style: TextStyle(color: orangeAccent, fontSize: 20),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: orangeAccent,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _accentCard() {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          child: Card(
            elevation: 5,
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffeb872f),
                    Color(0xffedd9c7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Resturant of weak', //
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Kinkao Korean', //
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 0.0,
          child: Image.asset(
            'assets/images/img1.png', //
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _categories() {
    return Container(
        // margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Card(
                  shape: StadiumBorder(),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.access_alarm,
                      size: 40,
                      color: orangeAccent,
                    ),
                  )),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'Recipe Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            )
          ],
        ));
  }

  Widget _drawer(BuildContext context, String count) {
    return Container(
      // We add COntainer bcz customiz width
      width: MediaQuery.of(context).size.width * 0.56,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            _headerDrawer(),
            _createDrawerItem(
                icon: Icons.home,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                text: 'Home'),
            _createDrawerItem(
                icon: Icons.account_circle,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                text: 'My Account'),
            _createDrawerItem(
                icon: Icons.format_list_numbered,
                onTap: () {},
                text: 'My Order'),
            _createDrawerShoppingItem(
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                text: 'Shoping Cart',
                count: count),
            _createDrawerItem(
              icon: Icons.favorite,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              text: 'Favourite',
            ),
            _createDrawerItem(
                icon: Icons.share,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                text: 'invit Friends'),
            Divider(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerDrawer() {
    return UserAccountsDrawerHeader(
        otherAccountsPictures: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(icon: Icon(Icons.remove_circle), onPressed: null),
          )
        ],
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              orangeAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        currentAccountPicture: CircleAvatar(
            //Account Pic
            backgroundImage: AssetImage('assets/images/img5.jpg'),
            backgroundColor: Colors.white,
            child: null),
        accountName: Text('data'),
        accountEmail: Text('@gmail.com'));
  }

  Widget _createDrawerItem({
    IconData icon,
    String text,
    GestureTapCallback onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(text),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createDrawerShoppingItem(
      {IconData icon, String text, GestureTapCallback onTap, String count}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(text),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              count,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _popularRes(BuildContext context, Items items) {
    return AspectRatio(
      aspectRatio: 0.76 / 1,
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                items: items,
              );
            }));
          },
          child: Card(
            margin: EdgeInsets.all(15),
            elevation: 3.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: items.title,
                        child: Image.asset(
                          items.img,
                          // items image
                          // 'assets/images/img6.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //item title
                          items.title,
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Wrap(
                          runSpacing: 5.0,
                          spacing: 5.0,
                          children: [
                            Text(
                              //item dec
                              items.desc,
                              maxLines: 1,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
