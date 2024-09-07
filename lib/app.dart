import 'package:flutter/material.dart';
import 'package:assignment_m13/shopping_cart.dart';
class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingCartPage(),
    );
  }
}