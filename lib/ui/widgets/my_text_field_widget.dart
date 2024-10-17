// ignore_for_file: file_names, override_on_non_overriding_member, unused_import, deprecated_member_use, sized_box_for_whitespace, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:royaltaxi/utils/helper.dart';

class MyTextFieldWidget extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextInputType keyboardType;
  final bool hideTextField;
  final VoidCallback click;
  final String? value;
  final TextEditingController? controller;

  const MyTextFieldWidget({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.value,
    this.suffixIcon,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.hideTextField = false,
    required this.click,
  });

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        readOnly: widget.readOnly,
        initialValue: widget.value,
        onTap: () {
          widget.click();
        },
        style: TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: HexColor("#E4E9F2"),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).disabledColor,
              )),
          // labelStyle: new TextStyle(color: Colors.white),
          // border: InputBorder.none,
          hintStyle: TextStyle(
              fontFamily: "SfUiDisplay",
              fontSize: 14,
              color: Theme.of(context).disabledColor,
              fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.only(top: 15, left: 15),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
