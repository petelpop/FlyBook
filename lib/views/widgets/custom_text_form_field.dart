import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.hintText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            style: blackTextStyle,
            cursorColor: kBlackColor,
            obscureText: obscureText,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: greyTextStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(color: kPrimaryColor),
                )),
          )
        ],
      ),
    );
  }
}
