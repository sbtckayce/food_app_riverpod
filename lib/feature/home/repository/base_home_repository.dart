


import '../model/category/category_model.dart';
import '../model/product/product_model.dart';



abstract class BaseHomeRepository{

  Future<List<CategoryModel>> getAllCategory();

   Future<List<ProductModel>> getAllProduct(String cate);

 
}