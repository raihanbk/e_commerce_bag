import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/banners.dart';

class BannerOffer extends StatelessWidget {
  const BannerOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
      child: CarouselSlider.builder(
          itemCount: offerBanner.length,
          itemBuilder: (context, index, newIndex) {
            final banner = offerBanner[index];
            return buildBanner(banner, index,);
          },
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 200,
              viewportFraction: 1,
          )),
    );
  }

  Widget buildBanner(String banner, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(banner),
              fit: BoxFit.fill)
      ),
    );
  }
}