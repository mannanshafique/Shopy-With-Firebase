import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shopy_firebase/Model/Items.dart';
import 'package:shopy_firebase/Provider/ProviderCart.dart';

class CustomWidgets {
  //appbar icon
  Widget iconButton(IconData iconData, Function function, String count) {
    return (iconData != Icons.shopping_cart)
        ? Badge(
            showBadge: false,
            child: Card(
              shape: StadiumBorder(),
              elevation: 5.0,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.1),
                child: IconButton(
                  icon: Icon(iconData),
                  onPressed: function,
                  color: Colors.black,
                ),
              ),
            ),
          )
        : Card(
            shape: StadiumBorder(),
            elevation: 5.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Badge(
                showBadge: true,
                padding: EdgeInsets.all(6),
                badgeColor: orangeAccent,
                badgeContent: Text(count),
                child: IconButton(
                  icon: Icon(iconData),
                  onPressed: function,
                  color: Colors.black,
                ),
              ),
            ),
          );
  }
}

final blackColor = Colors.black;
final orangeAccent = Colors.orangeAccent[700];

//Detail Screen Widgets

class TabbarDetailPage extends StatefulWidget {
  final Items items;
  TabbarDetailPage({this.items});
  _GameTopChartsTabsState createState() => _GameTopChartsTabsState();
}

class _GameTopChartsTabsState extends State<TabbarDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = new TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return innerNestedTabs();
  }

  Widget innerNestedTabs() {
    return DefaultTabController(
      length: 5,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                new Expanded(child: new Container()),
                new TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  labelPadding: EdgeInsets.all(10.0),
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3.0,
                  tabs: [
                    Text(
                      "DESCRIPTION",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "SPECIFICATION",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "FEATHER",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "TOP PAID",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "TOP RATED",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                child: Text(
                  //items desc
                  widget.items.desc,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Specification')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TRENDING')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP PAID')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
          ],
        ),
      ),
    );
  }
}
