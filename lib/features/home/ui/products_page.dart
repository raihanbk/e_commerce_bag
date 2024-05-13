import 'package:e_commerce_bag/features/home/model/bag_model.dart';
import 'package:e_commerce_bag/features/home/ui/product_detail_page.dart';
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
        title: const Text('Evaly',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
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
      body: Container(
        color: Colors.grey.shade300,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75,
          children: List.generate(
            bag.length,
            (index) => InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProductDetails(bagModel: bag[index],)));
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(bag[index].productImg!))),
                    ),
                    Text(
                      bag[index].productName!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(bag[index].productDesc!),
                    Text(
                      bag[index].productPrice!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
