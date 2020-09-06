import 'package:flutter/material.dart';
import 'package:shopy_firebase/extension/extension.dart';

class CustomWidgets {
  Widget iconButton(IconData iconData, Function function) {
    return IconButton(
            icon: Icon(
              iconData,
              size: 28,
              color: Colors.black,
            ),
            onPressed: function)
        .circleAvatar();
  }
}

final blackColor = Colors.black;
final orangeAccent = Colors.orangeAccent[700];

//Detail Screen Widgets

class TabbarDetailPage extends StatefulWidget {
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
                  "Is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
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
