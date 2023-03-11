import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/common/common.dart';


import '../../../gen/colors.gen.dart';
import '../provider/cart_provider.dart';
import 'cart_item.dart';

class CartList extends ConsumerStatefulWidget {
  const CartList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartListState();
}

class _CartListState extends ConsumerState<CartList> {
  @override
  Widget build(BuildContext context) {
    final products = ref.read(cartProvider).products;
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: ref
            .read(cartProvider.notifier)
            .productQuantity(products)
            .keys
            .length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
            
              ref.read(cartProvider.notifier).removeItemProduct(ref
                  .read(cartProvider.notifier)
                  .productQuantity(products)
                  .keys
                  .elementAt(index));
            },
            background: Container(
              color: ColorName.red,
              child: Icon(Icons.delete,color: Colors.white,),
            ),
            child: CartItem(
              productModel: ref
                  .read(cartProvider.notifier)
                  .productQuantity(products)
                  .keys
                  .elementAt(index),
              quantity: ref
                  .read(cartProvider.notifier)
                  .productQuantity(products)
                  .values
                  .elementAt(index),
            ),
          );
        },
      ),
    );
  }
}
