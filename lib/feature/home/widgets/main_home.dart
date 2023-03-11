import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_app_api/feature/cart/provider/cart_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../common/common.dart';
import '../../../gen/colors.gen.dart';
import 'widgets.dart';

class MainHome extends ConsumerStatefulWidget {
  const MainHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomeState();
}

class _MainHomeState extends ConsumerState<MainHome> {
  @override
  Widget build(BuildContext context) {
  int  numberItemInCart() {
      final products = ref.watch(cartProvider).products;
      final productsToSet = {...products};
      return productsToSet.length;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    ZoomDrawer.of(context)!.toggle();
                  },
                  child: const Icon(
                    Icons.menu_outlined,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/cart');
                   

                  },
                  child: Badge(
                        child: Icon(
                        Icons.shopping_cart_outlined,
                        color: ColorName.gray,
                        size: 30,
                      ),
                        label: Text(
                        numberItemInCart().toString(),style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15,color: ColorName.white),
                        
                      ),
                  
                      backgroundColor: ColorName.red,
                     
                      )
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Delicious',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 30),
            ),
            Text(
              'food for you',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const BuildSearchBar(),
            const SizedBox(
              height: 20,
            ),
            const ListViewCategory(),
            const SizedBox(
              height: 10,
            ),
            const ListViewProduct()
          ],
        ),
      ),
    );
    ;
  }
}
