import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/feature/home/model/product/product_model.dart';
import 'package:food_app_api/feature/wishlist/provider/wishlist_provider.dart';
import 'package:food_app_api/gen/colors.gen.dart';

class WishlistItem extends ConsumerWidget {
  const WishlistItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void removeWishlist(){
 ref.read(wishlistProvider.notifier).removeWishlist(productModel);
    }

    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorName.black.withOpacity(0.5),
          image: DecorationImage(
              image: NetworkImage(productModel.images![0].imageUrl!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.multiply))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              productModel.foodName!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ColorName.white),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${productModel.price.toString()}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorName.white),
                ),
                GestureDetector(
                  onTap: removeWishlist,
                  child: Icon(Icons.delete,color: ColorName.white,),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
