import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  
  const CategoryModel._();

  factory CategoryModel(
      {required String cateId,
      required String cateName,
      required String cateImage,
      required DateTime createdAt,
      required DateTime updatedAt}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.empty()=> CategoryModel(cateId: '', 
  cateName: '',
  cateImage: '',
   createdAt: DateTime.now(),
    updatedAt: DateTime.now());

}
