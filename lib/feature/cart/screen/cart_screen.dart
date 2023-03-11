import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/common/common.dart';
import 'package:food_app_api/feature/cart/provider/cart_provider.dart';
import 'package:food_app_api/common/cart_summary.dart';
import 'package:food_app_api/gen/assets.gen.dart';
import 'package:food_app_api/gen/colors.gen.dart';

import 'package:go_router/go_router.dart';

import '../../../common/custom_button.dart';

import '../widgets/cart_list.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(cartProvider).products;
    final subTotal = ref.watch(cartProvider.notifier).subTotal(products);
    final deliveryFeeContent =
        ref.watch(cartProvider.notifier).deliveryFeeContent(subTotal);
    return Scaffold(
        backgroundColor: ColorName.backgroundColor,
        appBar: CustomAppBar(
          title: 'Cart',
          onTap: () {
            GoRouter.of(context).goNamed('home');
          },
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: products.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  deliveryFeeContent,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorName.primaryColor),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    context.go('/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorName.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  child: Text(
                                    'Add more...',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: ColorName.white),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CartList(),
                        ],
                      ),
                      Column(
                        children: [
                          CartSummary(),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            text: 'Go to Checkout',
                            onPress: () {
                              GoRouter.of(context).push('/checkout');
                            },
                          )
                        ],
                      )
                    ],
                  )
                : NoItem(
                    title: 'No Cart yet',
                    imageUrl: Assets.images.noCartIcon.path,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  )));
  }
}
