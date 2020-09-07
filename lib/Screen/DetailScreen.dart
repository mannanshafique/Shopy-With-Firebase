import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopy_firebase/Model/Items.dart';
import 'package:shopy_firebase/Provider/ProviderCart.dart';
import 'package:shopy_firebase/widgets/widgets.dart';

import 'CheckOutScreen.dart';

class DetailScreen extends StatefulWidget {
  final Items items;
  DetailScreen({this.items});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<ProviderCart>(
      builder: (context, providerCart, child) {
        return Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
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
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    height: height * 0.49,
                    width: width,
                    child: Hero(
                      tag: widget.items.title,
                      child: Image.asset(
                        //items img
                        widget.items.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0.0,
                      child: IconButton(
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 25,
                                color: orangeAccent,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                  Positioned(
                      right: 10.0,
                      top: height * 0.256,
                      child:
                          CustomWidgets().iconButton(Icons.shopping_cart, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOutScreen()));
                      }, providerCart.count.toString())),
                  Positioned(
                      right: 5.0,
                      top: height * 0.32,
                      child: FlatButton.icon(
                        splashColor: Colors.orange[100],
                        label: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        icon: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        color: orangeAccent,
                        onPressed: () {
                          providerCart.add(widget.items);
                        },
                      )),
                  Positioned(
                      top: height * 0.4,
                      bottom: 40.0,
                      right: 0.0,
                      left: width * 0.14,
                      child: Card(
                          elevation: 5.0,
                          margin: EdgeInsets.all(0.0),
                          color: Colors.white,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, bottom: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //items title
                                        widget.items.title,
                                        style: TextStyle(
                                            color: blackColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        //items price
                                        '\$ ${widget.items.price}',
                                        style: TextStyle(
                                            color: orangeAccent,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: height * 0.42,
                                    child: TabbarDetailPage(
                                      items: widget.items,
                                    ))
                              ])))
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
