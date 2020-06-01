

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/model/cart.dart';
import 'package:shoping_cart/model/product.dart';
import 'package:shoping_cart/ui/shopping_cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Product> products = [
    Product(name: "Apple", price: 235),
    Product(name: "Mango", price: 125),
    Product(name: "Banana", price: 100),
    Product(name: "Orange", price: 135),
    Product(name: "Grapes", price: 400),
    Product(name: "Avocado", price: 350),
    Product(name: "Litchi", price: 50),
    Product(name: "Dragon fruits", price: 500),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context,cart,child){
        return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Carts()));
                    }),
                Text(cart.basketItems.length.toString())
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('Price Rs.' + products[index].price.toString()),
            trailing: Icon(Icons.add),
            onTap: (){
              cart.add(products[index]);
            },
          );
        }
        ),
    );
      },
    );
  }
}
