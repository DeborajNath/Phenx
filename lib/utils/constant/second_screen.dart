import 'package:flutter/material.dart';
import 'package:phenx/utils/constant/body.dart';

import '../../model/product.dart';

class SecondScreen extends StatelessWidget {
  final Product product;
  const SecondScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Center(
          child: Text(
        'Details',
        style: TextStyle(color: Colors.black),
      )),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: const <Widget>[
        IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: null)
      ],
    );
  }
}
