import 'package:e_commerce_bag/features/home/model/bag_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final BagModel bagModel;

  const ProductTile({
    super.key,
    required this.bagModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Evaly'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.person_2_outlined,
              size: 32,
            ),
          )
        ],
      ),
      body: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: List.generate(
                  bag.length,
                  (index) => Container(
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(bag[index].productImg!))),
                            ),
                            Text(bag[index].productName!),
                            Text(bag[index].productDesc!),
                            Text(bag[index].productPrice!),
                          ],
                        ),
                      ),
    ),
    ),
    );
  }
}
