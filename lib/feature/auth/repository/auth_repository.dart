import 'package:dio/dio.dart';
import 'package:food_app_api/feature/auth/models/user_model.dart';
import 'package:food_app_api/feature/auth/repository/base_auth_repository.dart';
import 'package:food_app_api/network/dio_client.dart';
import 'package:food_app_api/network/endpoint.dart';
import 'package:food_app_api/network/network.dart';

class AuthRepository extends BaseAuthRepository {
 
  final DioClient client = DioClient(dio: Dio());
  @override
  Future<void> loginWithUser({required UserModel user}) async {
    final data = {'email': user.email, 'password': user.password};


     await client.post('${Endpoints.baseUrl}/user/sign-in', data: data);
  }

  @override
  Future<void> registerWithUser({required UserModel user}) async {
    final data = {
      'address': user.address,
      'email': user.email,
      'fullName': user.fullName,
      'password': user.password,
      'phone': user.password,
    };

        await client.post('${Endpoints.baseUrl}/user/sign-up', data: data);

  }
}
