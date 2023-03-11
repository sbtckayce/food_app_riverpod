import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_api/feature/auth/provider/user_provider.dart';

import 'package:food_app_api/feature/auth/repository/auth_repository.dart';

import '../../../common/common.dart';

import '../../../gen/colors.gen.dart';
import '../../../shared/themes/themes.dart';
import '../models/models.dart';

class Register extends ConsumerWidget {
  Register({
    super.key,
  });
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  register() async {
    String email = emailController.text;
    String fullName = fullNameController.text;
    String password = passwordController.text;
    String phone = phoneController.text;

    await AuthRepository()
        .registerWithUser(
            user: UserModel(
                address: '',
                email: email,
                fullName: fullName,
                password: password,
                phone: phone))
        .then((value) {
      Fluttertoast.showToast(
        msg: "Register successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorName.white,
        textColor: ColorName.white,
      );
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
  Widget build(BuildContext context, WidgetRef ref) {
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
                isError: textError.toString()),
            const SizedBox(
              height: 20,
            ),
            BuildTextFormFieldAuth(
                lable: 'Full Name',
                controller: fullNameController,
                onChange: (value) {
                  ref.read(userProvider.notifier).checkFullName(value);
                },
                isError: textError.toString()),
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
              height: 20,
            ),
            BuildTextFormFieldAuth(
                lable: 'Phone number',
                controller: phoneController,
                onChange: (value) {
                  ref.read(userProvider.notifier).checkPhone(value);
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
              height: 50,
            ),
            CustomButton(
              text: 'Register',
              onPress: register,
            )
          ],
        ),
      ),
    );
  }
}
