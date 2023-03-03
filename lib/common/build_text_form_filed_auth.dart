import 'package:flutter/material.dart';

class BuildTextFormFieldAuth extends StatefulWidget {
  const BuildTextFormFieldAuth(
      {super.key,
      required this.lable,
      required this.controller,
      this.isError,
      this.isPassword = false,
      this.onChange});
  final String lable;

  final TextEditingController controller;
  final String? isError;
  final bool? isPassword;
  final Function(String)? onChange;

  @override
  State<BuildTextFormFieldAuth> createState() => _BuildTextFormFieldAuthState();
}

class _BuildTextFormFieldAuthState extends State<BuildTextFormFieldAuth> {
  bool isPasswordIcon = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        TextFormField(
          onChanged: widget.onChange,
          controller: widget.controller,
          style: TextStyle(fontWeight: FontWeight.bold),
          obscureText: (widget.isPassword == true) ? isPasswordIcon : false,
          decoration: InputDecoration(
              suffixIcon: (widget.isPassword == true)
                  ? IconButton(
                      icon: Icon(
                        isPasswordIcon
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordIcon = !isPasswordIcon;
                        });
                      })
                  : null,
                
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          (widget.isError == '') ? Colors.green : Colors.red))),
        ),
        // if (widget.isError != null || widget.isError!.isNotEmpty)
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SizedBox(
        //         height: 5,
        //       ),
        //       Text(
        //         widget.isError.toString(),
        //         style: Theme.of(context)
        //             .textTheme
        //             .bodyMedium!
        //             .copyWith(color: Colors.redAccent),
        //       )
        //     ],
        //   )
      ],
    );
  }
}
