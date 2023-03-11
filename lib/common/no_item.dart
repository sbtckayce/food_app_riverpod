import 'package:flutter/material.dart';


import 'custom_button.dart';

class NoItem extends StatelessWidget {
  const NoItem({super.key, required this.title, required this.imageUrl,  this.onPress, this.isButton=true});
  final String title;
  final String imageUrl;

  final bool isButton;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
  return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(imageUrl),
                const SizedBox(height: 20,),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Spacer(),
               isButton ? CustomButton(
                  text: 'Go to Home',
                  onPress: onPress,
                ) : Container()
              ],
            ),
          );
  }
}