import 'package:flutter/material.dart';

import '../../model/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function() press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0 / 4),
            child: Text(
              product.title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Text(
            'Rs ${product.price}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
