import 'package:flutter/material.dart';

import '../../model/product.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset(
              product.image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(product.star),
                      ),
                      Text(product.reviews),
                      const Expanded(
                          child: Text(
                        " Reviews",
                        style: TextStyle(color: Colors.grey),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(product.description)
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rs ${product.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 30),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 60,
                  child: TextButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Add to Bag',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ])
          // Expanded(child: MyTabScreen())
        ],
      ),
    );
  }
}
