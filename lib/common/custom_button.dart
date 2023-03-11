import 'package:flutter/material.dart';


import '../gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
       this.textColor=Colors.white,
       this.buttonColor=ColorName.buttonColor, this.onPress});
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        onPressed: onPress,
        child: Container(
          width: double.infinity,
        
         padding: EdgeInsets.only(top: 20,bottom: 20),
          child: Center(
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold)),
          ),
        ));
  }
}
