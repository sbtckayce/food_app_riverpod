import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_api/common/common.dart';
import 'package:food_app_api/feature/cart/provider/cart_provider.dart';
import 'package:food_app_api/feature/home/model/product/product_model.dart';
import 'package:food_app_api/feature/wishlist/provider/wishlist_provider.dart';
import 'package:food_app_api/gen/colors.gen.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlist = ref.watch(wishlistProvider).wishlists;

    void addWishlist() {
      if (wishlist.contains(widget.productModel)) {
        Fluttertoast.showToast(
            msg: 'Cannot add product for wishlist',
            backgroundColor: ColorName.red);
      } else {
        ref.read(wishlistProvider.notifier).addWishlist(widget.productModel);
        GoRouter.of(context).pushNamed('wishlist');
      }
    }

    return Scaffold(
      backgroundColor: ColorName.backgroundColor,
      appBar: CustomAppBar(
        title: widget.productModel.foodName.toString(),
        onTap: () {
          GoRouter.of(context).goNamed('home');
        },
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.productModel.images![0].imageUrl!),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Loại',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  widget.productModel.cateName.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mô tả',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  widget.productModel.description.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: ColorName.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giá cả',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '\$${widget.productModel.price.toString()}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorName.red),
                ),
              ],
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 60),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      backgroundColor: ColorName.buttonColor,
                    ),
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .addProduct(widget.productModel);
                      Fluttertoast.showToast(
                          msg: 'AddProduct', backgroundColor: ColorName.green);
                      GoRouter.of(context).goNamed('cart');
                    },
                    child: Text(
                      'Add To Cart',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorName.white),
                    )),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: addWishlist,
                  child: wishlist.contains(widget.productModel)
                      ? Icon(
                          Icons.favorite,
                          color: ColorName.buttonColor,
                        )
                      : Icon(Icons.favorite_outline),
                ),
              )
            ],
          )),
    );
  }
}
