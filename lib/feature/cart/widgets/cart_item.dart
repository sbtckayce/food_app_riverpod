import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_api/feature/cart/provider/cart_provider.dart';

import '../../../gen/colors.gen.dart';
import '../../home/model/product/product_model.dart';

class CartItem extends ConsumerWidget {
  const CartItem(
      {super.key, required this.productModel, required this.quantity});

  final ProductModel productModel;
  final int quantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 120,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorName.black,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        ColorName.black.withOpacity(0.5), BlendMode.multiply),
                    image: NetworkImage(
                      productModel.images![0].imageUrl!,
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel.foodName!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productModel.price}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorName.primaryColor),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorName.primaryColor),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (quantity > 1) {
                                ref
                                    .read(cartProvider.notifier)
                                    .removeProduct(productModel);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Cannot reduce the number to 0',
                                    backgroundColor: ColorName.red);
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: ColorName.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${quantity}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: ColorName.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .addProduct(productModel);
                            },
                            child: Icon(
                              Icons.add,
                              color: ColorName.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
