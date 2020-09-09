import 'package:flutter/material.dart';
import 'package:shopy_firebase/Model/Items.dart';
import 'package:shopy_firebase/Screen/DetailScreen.dart';
import 'package:shopy_firebase/widgets/widgets.dart';

// Search Delegeate

class Searching extends SearchDelegate<Items> {
  List<Items> items;
  Searching(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist = query.isEmpty
        ? items
        : items
            .where((p) => p.title.toUpperCase().startsWith(query.toUpperCase()))
            .toList();

    return searchlist.isEmpty
        ? Padding(
            padding: EdgeInsets.only(left: 70, top: 25),
            child: Text(
              'No item Found',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          )
        : ListView.builder(
            itemCount: searchlist.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  items: items[index],
                                )));
                  },
                  leading: Hero(
                    tag: items[index].title,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(searchlist[index].img),
                    ),
                  ),

                  // leading: ConstrainedBox(     //For Flags
                  //     constraints: BoxConstraints(
                  //       minWidth: 44,
                  //       minHeight: 44,
                  //       maxWidth: 64,
                  //       maxHeight: 64,
                  //     ),
                  //     child: Image(image: NetworkImage(searchlist[index]))),
                  subtitle: Text(searchlist[index].desc),
                  trailing: Text(
                    '\$ ${searchlist[index].price.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: orangeAccent, fontSize: 18),
                  ),
                  title: RichText(
                    text: TextSpan(
                        text:
                            searchlist[index].title.substring(0, query.length),
                        style: TextStyle(
                            color: orangeAccent, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: searchlist[index]
                                  .title
                                  .substring(query.length),
                              style: TextStyle(color: Colors.black))
                        ]),
                  ));
            });
  }
}
