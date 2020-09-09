import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_firebase/Provider/ProviderCart.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderCart>(
      builder: (context, providerCart, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.6),
                  radius: 30,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.orange,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'CheckOut Screen',
              style: TextStyle(color: Colors.orange),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[100],
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: (providerCart.count == 0)
                            ? Center(
                                child: Text(
                                  'No Item in Cart',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              )
                            : ListView.builder(
                                itemCount: providerCart.count,
                                itemBuilder: (context, index) {
                                  var items = providerCart.basketItems[index];
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(items.img),
                                    ),
                                    title: Text('${items.title}'),
                                    subtitle: Text(items.desc),
                                    trailing: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        providerCart.remove(items);
                                      },
                                    ),
                                  );
                                }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$ ${providerCart.totalPrice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
