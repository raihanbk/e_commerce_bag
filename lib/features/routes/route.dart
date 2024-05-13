import 'package:e_commerce_bag/features/cart/cart.dart';
import 'package:e_commerce_bag/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../home/ui/home.dart';
import '../wishlist/wishlist.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  int isSelected = 0;
  static final List _tabs = [
    const Home(),
    const Wishlist(),
    const Cart(),
    const Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        indicatorShape: const CircleBorder(),
        elevation: 0,
        onDestinationSelected: (index) {
          setState(() {
            isSelected = index;
          });
        },
        selectedIndex: isSelected,
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home"),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              icon: Icon(Icons.search_outlined),
              label: "Wishlist"),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              icon: Icon(Icons.favorite_border),
              label: "Cart"),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
              icon: Icon(Icons.add_shopping_cart),
              label: "Dashboard"),
        ],
      ),
      body: _tabs[isSelected],
    );
  }
}
