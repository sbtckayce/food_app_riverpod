import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  const UserModel._();

  factory UserModel({
    required String address,
    required String email,
    required String fullName,
    required String password,
    required String phone
  }) = _UserModel;
  factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.empty()=> UserModel(address: '', email: '', fullName: '', password: '', phone: '');
}