import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phenx/model/product.dart';
import 'package:phenx/presentation/widgets/item_card.dart';

import 'package:phenx/presentation/widgets/index.dart';
import 'package:phenx/utils/constant/second_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> with SingleTickerProviderStateMixin {
  // late TabController _tabController;

  // @override
  // void initState() {
  //   _tabController = TabController(length: 4, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'hi ${user.email!}',
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            Expanded(
              child: IconButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: const Icon(Icons.logout_rounded, size: 32),
                color: Colors.black,
              ),
            ),
          ],
        ),
        leading: AppBarLeading(
          onTap: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Explore the',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 50,
                        width: 200,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'collections',
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 110,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.black,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Best',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text('for you',
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              "List Of All The Items",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              product: products[index],
                            ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
