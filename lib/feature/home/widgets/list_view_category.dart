import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/colors.gen.dart';
import '../../../shared/themes/themes.dart';

import '../model/category/category_model.dart';
import '../provider/home_provider.dart';
import 'widgets.dart';

class ListViewCategory extends ConsumerWidget {
  const ListViewCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<CategoryModel>> listCategories =
        ref.watch(categoryProvider);
    return listCategories.when(
                  data: (data) {
                    return TabBar(
                       
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelColor: ColorName.primaryColor,
                        indicatorColor: ColorName.primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: ColorName.gray,
                        tabs: List.generate(data.length,
                            (index) => TabBarItem(categoryModel: data[index])));
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const CircularProgressIndicator(),
                );
  }
}