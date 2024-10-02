import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      // body:
      body: IconButton(
          onPressed: () {
            AlertDialog(
              title: Text("name"),
            );
          },
          icon: Icon(Icons.abc)),
    );
  }
}
