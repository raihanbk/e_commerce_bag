import 'package:e_commerce_bag/features/home/model/bag_model.dart';
import 'package:e_commerce_bag/features/home/ui/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'banners.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final BagModel bagModel = BagModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Evaly',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
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
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: const Color(0xFFF1F3F2),
                    borderRadius: BorderRadius.circular(15)),
                child: const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                      border: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'What would you like to bye?',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            const BannerOffer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rowItems(
                    name: 'Popular',
                    icon: const Icon(
                      Icons.gradient_sharp,
                      color: Colors.pinkAccent,
                    )),
                rowItems(
                    name: 'Flash sale',
                    icon: const Icon(
                      Icons.access_time_rounded,
                      color: Colors.orange,
                    )),
                rowItems(
                    name: 'Evaly store',
                    icon: const Icon(Icons.car_crash, color: Colors.teal)),
                rowItems(
                    name: 'Voucher',
                    icon: const Icon(
                      Icons.card_giftcard,
                      color: Colors.blue,
                    )),
              ],
            ),
            TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                tabs: const [
                  Tab(
                    text: 'Categories',
                  ),
                  Tab(
                    text: 'Brands',
                  ),
                  Tab(
                    text: 'Shops',
                  ),
                ]),
            SizedBox(
              height: 250,
              child: TabBarView(
                controller: _tabController,
                children: [
                    CategoryTile(bagModel: bagModel),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowItems({required String name, required Icon icon}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xFFF1F3F2),
                borderRadius: BorderRadius.circular(50)),
            child: icon,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
