import 'package:e_commerce_bag/features/home/model/bag_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final BagModel bagModel;

  const ProductDetails({super.key, required this.bagModel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Evaly', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.bagModel.productImg!))),
            ),
            divider(),
            ExpansionTile(
                collapsedIconColor: Colors.grey,
                leading: const Text(
                  'SKU',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                title: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25),
                  child: const Text(
                    '0x4c86a',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                )),
            divider(),
            ListTile(
              leading: Text(
                'PRICE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: Text(
                widget.bagModel.productPrice!,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            divider(),
            ListTile(
              leading: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Icon(Icons.favorite_outline),
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'ADD TO CART',
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'AVAILABLE AT SHOPS',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      thickness: 10,
      color: Colors.grey.shade200,
    );
  }
}
