


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/feature/home/model/product/product_model.dart';

class WishlistProvider extends ChangeNotifier{
  final List<ProductModel> wishlists =[];

  void addWishlist(ProductModel p){
    wishlists.add(p);
    notifyListeners();
  }
  void removeWishlist(ProductModel p){
    wishlists.remove(p);
    notifyListeners();
  }

}
final wishlistProvider = ChangeNotifierProvider((ref) => WishlistProvider());