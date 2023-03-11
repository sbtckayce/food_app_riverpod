import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product/product_model.dart';
import '../provider/home_provider.dart';
import 'widgets.dart';

class ListViewProduct extends ConsumerWidget {
  const ListViewProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<ProductModel>> fruitProducts = ref.watch(fruitProvider);
    AsyncValue<List<ProductModel>> breadProducts = ref.watch(breadProvider);
    AsyncValue<List<ProductModel>> iceCreamProducts =
        ref.watch(iceCreamProvider);
    
    return SizedBox(
      height: 300,
      child: TabBarView(
        
        
        children: [
        fruitProducts.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TabListItem(productModel: data[index]);
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
        breadProducts.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TabListItem(productModel: data[index]);
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
        iceCreamProducts.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TabListItem(productModel: data[index]);
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        )
      ]),
    );
  }
}
