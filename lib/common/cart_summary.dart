import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/common/common.dart';
import 'package:go_router/go_router.dart';

import '../gen/colors.gen.dart';

import '../feature/cart/provider/cart_provider.dart';

class CartSummary extends ConsumerStatefulWidget {
  const CartSummary({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartSummaryState();
}

class _CartSummaryState extends ConsumerState<CartSummary> {

  @override
  Widget build(BuildContext context) {
     final products = ref.watch(cartProvider).products;
    final subTotal = ref.watch(cartProvider.notifier).subTotal(products);
    final deliveryFee = ref.watch(cartProvider.notifier).deliveryFee(subTotal);
    final deliveryFeeContent =
        ref.watch(cartProvider.notifier).deliveryFeeContent(subTotal);
    final total = ref.watch(cartProvider.notifier).total(subTotal, deliveryFee);

    return Column(
      children: [
        Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SubTotal',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '\$ $subTotal',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: ColorName.primaryColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '\$ $deliveryFee',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: ColorName.primaryColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '\$ $total',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: ColorName.primaryColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
 
                        ],
                      ),
                    ),
                   
      ],
    );
  }
}