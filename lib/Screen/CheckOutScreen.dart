import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_firebase/Provider/ProviderCart.dart';
import 'package:shopy_firebase/widgets/widgets.dart';

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
                                  // var items = providerCart.basketItems[index];
                                  var items = providerCart.basketItems[index];
                                  return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(items.img),
                                      ),
                                      title: Text('${items.title}'),
                                      subtitle: Text(items.quantity.toString() +
                                          " x " +
                                          '${items.price.toInt().toString()} \$' +
                                          " = " +
                                          ('${items.quantity * items.price.toInt()} \$')
                                              .toString()),
                                      trailing: SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            _increButton(Icons.add, () {
                                              providerCart.updateProduct(
                                                  items, items.quantity + 1);
                                            }),
                                            _increButton(Icons.remove, () {
                                              providerCart.updateProduct(
                                                  items, items.quantity - 1);
                                            }),
                                            _increButton(Icons.delete, () {
                                              providerCart.removeProduct(items);
                                            }),
                                          ],
                                        ),
                                      ));
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
                              '\$ ${providerCart.totalprice}',
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

  Widget _increButton(IconData iconData, Function function) {
    return Card(
      shape: StadiumBorder(),
      elevation: 4,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          splashColor: Colors.transparent,
          icon: Icon(iconData),
          onPressed: function,
        ),
      ),
    );
  }
}
