import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/extension/auth_extension.dart';

class UserProvider extends StateNotifier<String> {
  UserProvider() : super('');

  String checkEmail(String email) {
    
    final isValidEmail = email.validateEmail();
    if (isValidEmail) {
      return state = '';
    }
    return state = 'Email inValid';
  }

  String checkPassword(String password) {
    final isValidPassword = password.validatePassword();
    if (isValidPassword) {
      return state = '';
    }
    return state =
        'Password Password should contain at least one upper case,lower case,digit,special character,8 characters in length';
  }

  String checkFullName(String fullName) {
    final isValidfullName = fullName.validateName();
    if (isValidfullName) {
      return state = '';
    }
    return state = 'Name Invalid';
  }

  String checkPhone(String phone) {
    final isValidphone = phone.validatePhone();
    if (isValidphone) {
      return state = '';
    }
    return state = 'Phone Invalid';
  }
}

final userProvider = StateNotifierProvider((ref) => UserProvider());
