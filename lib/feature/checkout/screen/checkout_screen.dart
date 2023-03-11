import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/common/common.dart';
import 'package:food_app_api/feature/cart/widgets/widgets.dart';
import 'package:food_app_api/shared/themes/themes.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/colors.gen.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorName.backgroundColor,
      appBar: CustomAppBar(title: 'Checkout',onTap: (){
        GoRouter.of(context).pop();
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
        
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    BuildTextFormFieldCheckout(
                      lable: 'Name',
                      controller: nameController,
                      hintText: 'Enter your Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextFormFieldCheckout(
                      lable: 'Address',
                      controller: nameController,
                      hintText: 'Enter your Address',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextFormFieldCheckout(
                      lable: 'Phone',
                      controller: nameController,
                      hintText: 'Enter your Phone number',
                    ),
                  ],
                ),
              
              ),
              const SizedBox(height: 100,),
              Column(
                children: [
                  CartSummary(),
                   const SizedBox(height: 10,),
                    CustomButton(text: 'Go to Order',onPress: (){
                      GoRouter.of(context).push('/order');
                    },)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
