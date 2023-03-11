import 'package:flutter/material.dart';

import '../model/category/category_model.dart';



class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Tab(
      text: categoryModel.cateName,
    );
  }
}
