

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/model/cart.dart';
import 'package:shoping_cart/ui/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>Cart(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

