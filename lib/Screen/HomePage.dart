import 'package:flutter/material.dart';
import 'package:shopy_firebase/Screen/DetailScreen.dart';
import 'package:shopy_firebase/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: _appbar(),
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
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return _popularRes(context);
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget _appbar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: EdgeInsets.all(2),
          child: CustomWidgets().iconButton(Icons.search, () {
            print('hello Search');
          }),
        ),
        Padding(
          padding: EdgeInsets.all(2),
          child: CustomWidgets().iconButton(Icons.shopping_cart, () {
            print('hello shoping cart');
          }),
        ),
      ],
      leading: Padding(
        padding: EdgeInsets.all(3),
        child: CustomWidgets().iconButton(Icons.person, () {
          print('hello Search');
        }),
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

  //COlored Card widget

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

// Categoriees horizontal

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

//Popular Resturants

  Widget _popularRes(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.76 / 1,
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen();
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
                      child: Image.asset(
                        'assets/images/img6.jpg',
                        fit: BoxFit.fill,
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
                          'Hello',
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
                              'Its owsome product dudefdsdfsdf',
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
