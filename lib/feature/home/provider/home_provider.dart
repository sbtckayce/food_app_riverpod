


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/feature/home/repository/home_repository.dart';

final categoryProvider = FutureProvider((ref) => HomeRepository().getAllCategory());
final fruitProvider = FutureProvider((ref) => HomeRepository().getAllProduct('Hoa quả'));
final breadProvider = FutureProvider((ref) => HomeRepository().getAllProduct('Bánh mì'));
final iceCreamProvider = FutureProvider((ref) => HomeRepository().getAllProduct('Kem cây'));


