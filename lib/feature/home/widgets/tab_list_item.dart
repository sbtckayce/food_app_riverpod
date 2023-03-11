import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import '../../../gen/colors.gen.dart';
import '../model/product/product_model.dart';

class TabListItem extends ConsumerStatefulWidget {
  const TabListItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabListItemState();
}

class _TabListItemState extends ConsumerState<TabListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).goNamed('detail', extra: widget.productModel);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: 200,
        decoration: BoxDecoration(
            color: ColorName.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: ColorName.black.withOpacity(0.6),
                  offset: Offset(0, 10))
            ],
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    ColorName.black.withOpacity(0.45), BlendMode.multiply),
                image: NetworkImage(widget.productModel.images![0].imageUrl!),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  widget.productModel.foodName!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20, color: ColorName.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: ColorName.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: ColorName.white,
                      size: 20,
                    ),
                    Text(
                      '\$${widget.productModel.price}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorName.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
