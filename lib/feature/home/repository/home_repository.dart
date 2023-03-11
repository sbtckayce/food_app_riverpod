import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:food_app_api/feature/home/repository/base_home_repository.dart';
import 'package:food_app_api/network/dio_client.dart';
import 'package:food_app_api/network/endpoint.dart';
import 'package:food_app_api/network/network.dart';

import '../model/category/category_model.dart';
import '../model/product/product_model.dart';

class HomeRepository extends BaseHomeRepository {
  final DioClient client = DioClient(dio: Dio());
  @override
  Future<List<CategoryModel>> getAllCategory() async {
    final response = await client.get('${Endpoints.baseUrl}/cate/list');

    if (response.statusCode == 200) {
      final List re = response.data['data'];

      return re.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<ProductModel>> getAllProduct(String cate) async {
    final response = await client.get('${Endpoints.baseUrl}/food/list');

    if (response.statusCode == 200) {
      final List re = response.data['data'];

      final List<ProductModel> result =
          re.map((e) => ProductModel.fromJson(e)).toList();

      return result.where((element) => element.cateName == cate).toList();
    } else {
      throw Exception();
    }
  }
}
