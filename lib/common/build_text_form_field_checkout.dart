import 'package:flutter/material.dart';


import '../gen/colors.gen.dart';

class BuildTextFormFieldCheckout extends StatefulWidget {
  const BuildTextFormFieldCheckout({super.key, required this.lable, required this.controller, this.onChange, required this.hintText});
  final String lable;
  final TextEditingController controller;
  final Function(String)? onChange;
  final String hintText;
  @override
  State<BuildTextFormFieldCheckout> createState() => _BuildTextFormFieldCheckoutState();
}

class _BuildTextFormFieldCheckoutState extends State<BuildTextFormFieldCheckout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(
          width: 60,
          child: Text(widget.lable,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.w500),)),
        const SizedBox(width: 10,),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorName.primaryColor))
            ),
          ),
        )
      ],),
    );
  }
}