import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/extension/auth_extension.dart';



class UserProvider extends StateNotifier<String> {
  UserProvider() : super('');

  String checkEmail(String email) {
  
    final emailCheck = email.validateEmail();
    if (emailCheck) {
      return state = '';
    }
    return state = 'Email inValid';
  }
   String checkPassword(String password) {
    final passwordCheck = password.validatePassword();
    if (passwordCheck) {
      return state = '';
    }
    return state = 'Password Password should contain at least one upper case,lower case,digit,special character,8 characters in length';
  }
    String checkFullName(String fullName) {
    final fullNameCheck = fullName.validateName();
    if (fullNameCheck) {
      return state = '';
    }
    return state = 'Name Invalid';
  }
   String checkPhone(String phone) {
    final phoneCheck = phone.validatePhone();
    if (phoneCheck) {
      return state = '';
    }
    return state = 'Phone Invalid';
  }
}

final userProvider = StateNotifierProvider((ref) => UserProvider());
