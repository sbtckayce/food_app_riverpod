import '../models/user_model.dart';

abstract class BaseAuthRepository {
  Future<void> loginWithUser({required UserModel user}) ;
  Future<void> registerWithUser({required UserModel user}) ;
}
