import 'package:e_commerce_bag/data/bag_list.dart';

class BagModel {
  String? category;
  String? categoryImg;
  String? categoryName;
  String? productImg;
  String? productName;
  String? productDesc;
  String? productPrice;

  BagModel({
    this.category,
    this.categoryImg,
    this.categoryName,
    this.productImg,
    this.productName,
    this.productDesc,
    this.productPrice,
  });
}

final List<BagModel> bag = Bags.bags
    .map((e) => BagModel(
        category: e['category'],
        categoryImg: e['categoryImg'],
        categoryName: e['categoryName'],
        productImg: e['productImg'],
        productName: e['productName'],
        productDesc: e['productDesc'],
        productPrice: e['productPrice']))
    .toList();
