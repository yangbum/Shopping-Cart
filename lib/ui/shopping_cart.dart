import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/model/cart.dart';
import 'package:shoping_cart/ui/checkout.dart';

class Carts extends StatefulWidget {
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            height: 50,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(  
                    children: <Widget>[
                       Text(
                    "Total Rs. ",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.5,
                  ),
                  Text(
                    cart.total.toString(),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.5,
                  ),
                    ],
                  ),
                  RaisedButton(
                    color: Colors.orange,
                          child: Text('Checkout',style: TextStyle(color: Colors.white),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Checkout()));
                          },
                        ),
                  
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('Cart'),
          ),
          body: cart.count == 0
              ? Center(
                  child: Text('There is no items on Cart'),
                )
              : ListView.builder(
                  itemCount: cart.basketItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(cart.basketItems[index].name),
                        subtitle: Text(
                            'Rs. ' + cart.basketItems[index].price.toString()),
                        trailing: Icon(Icons.delete),
                        onTap: () {
                          cart.remove(cart.basketItems[index]);
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
