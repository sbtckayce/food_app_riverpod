import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';


class MenuHome extends StatefulWidget {
  const MenuHome({super.key, 
  // required this.email
  });
// final  String email ;
  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                 
                  Text(
                    // widget.email.split('@')[0].toString(),
                    'email',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorName.white),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
                color: ColorName.white,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.add_shopping_cart,
                    color: ColorName.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Orders',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorName.white),
                  )
                ],
              ),
              
              Row(
                children: [
                  const Icon(
                    Icons.local_offer,
                    color: ColorName.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Offer and Promo',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorName.white),
                  )
                ],
              ),
                Row(
                children: [
                  const Icon(
                    Icons.policy,
                    color: ColorName.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Privacy policy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorName.white),
                  )
                ],
              ),
             
              Row(
                children: [
                  const Icon(
                    Icons.security,
                    color: ColorName.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Security',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorName.white),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: ColorName.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign-out',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorName.white),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
