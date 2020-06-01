import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/model/cart.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            height: 50,
            child: Card(
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have to pay Rs. ' + cart.total.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      textScaleFactor: 1.25,
                    ),
                  ],
                )),
          ),
          appBar: AppBar(
            title: Text('Check Out'),
          ),
          body: Container(
            color: Colors.lime[200],
            child: ListView.builder(
              itemCount: cart.basketItems.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          cart.basketItems[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs. ' + cart.basketItems[index].price.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Divider(),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
