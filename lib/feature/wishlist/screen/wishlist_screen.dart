import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/common/common.dart';
import 'package:food_app_api/feature/wishlist/provider/wishlist_provider.dart';
import 'package:food_app_api/feature/wishlist/widgets/wishlist_item.dart';
import 'package:food_app_api/gen/assets.gen.dart';
import 'package:food_app_api/gen/colors.gen.dart';
import 'package:go_router/go_router.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final wishlists = ref.watch(wishlistProvider).wishlists;
     return Scaffold(
      backgroundColor: ColorName.backgroundColor,
      appBar: CustomAppBar(title: 'Wishlist',onTap: (){
        GoRouter.of(context).pop();
      },),
      body: wishlists.isNotEmpty ?  ListView.builder(
        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          itemCount: wishlists.length,
          itemBuilder: (context, index) {
          return WishlistItem(productModel: wishlists[index]);
        },) : NoItem(title: 'No Wishlist', imageUrl: Assets.images.noHistoryIcon.path, isButton: false,)
      
    );
  }
}