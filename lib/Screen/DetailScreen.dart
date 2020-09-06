import 'package:flutter/material.dart';
import 'package:shopy_firebase/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
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
              child: Image.asset(
                'assets/images/img6.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                left: 0.0,
                child: IconButton(
                    icon: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      radius: 30,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: orangeAccent,
                        ),
                      ),
                    ),
                    onPressed: null)),
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
                  onPressed: () {},
                )),
            Positioned(
                top: height * 0.4,
                bottom: 30.0,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Food Name',
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$ 272',
                                  style: TextStyle(
                                      color: orangeAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: height * 0.42, child: TabbarDetailPage())
                        ])))
          ],
        ),
      ),
    ));
  }
}
