import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_api/feature/auth/models/user_model.dart';
import 'package:food_app_api/feature/auth/provider/user_provider.dart';

import 'package:food_app_api/feature/auth/repository/auth_repository.dart';

import 'package:go_router/go_router.dart';

import '../../../common/common.dart';

import '../../../gen/colors.gen.dart';
import '../../../shared/themes/themes.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

 login() async {
    String email = emailController.text;
    String password = passwordController.text;
    await AuthRepository()
        .loginWithUser(
            user: UserModel(
                address: '',
                email: email,
                fullName: '',
                password: password,
                phone: ''))
        .then((value) {
      Fluttertoast.showToast(
        msg: "Login successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorName.green,
        textColor: ColorName.white,
      );
   
      GoRouter.of(context).push('/home');
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorName.red,
        textColor: ColorName.white,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textError = ref.watch(userProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextFormFieldAuth(
              lable: 'Email',
              controller: emailController,
              onChange: (value) {
                ref.read(userProvider.notifier).checkEmail(value);
              },
              isError: textError.toString(),
            ),
            const SizedBox(
              height: 20,
            ),
            BuildTextFormFieldAuth(
                lable: 'Password',
                isPassword: true,
                controller: passwordController,
                onChange: (value) {
                  ref.read(userProvider.notifier).checkPassword(value);
                },
                isError: textError.toString()),
            const SizedBox(
              height: 10,
            ),
            Text(
              textError.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ColorName.red),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Forgot password?',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ColorName.primaryColor),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(text: 'Login', onPress: login)
          ],
        ),
      ),
    );
  }
}
