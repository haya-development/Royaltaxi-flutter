import 'package:flutter/material.dart';
import 'package:royaltaxi/utils/helper.dart';

class AdvancedTextFieldWidget extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardtype;
  final bool hideTextfild;
  final VoidCallback click;

  const AdvancedTextFieldWidget({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardtype = TextInputType.text,
    this.hideTextfild = false,
    required this.click,
  });

  @override
  State<AdvancedTextFieldWidget> createState() => _AdvancedTextFieldWidgetState();
}

class _AdvancedTextFieldWidgetState extends State<AdvancedTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          color: HexColor("#FFFFFF")),
      child: TextFormField(
        keyboardType: widget.keyboardtype,
        onTap: () {
          widget.click();
        },
        style: TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(
          //     color: HexColor("#E4E9F2"),
          //     width: 1,
          //   ),
          // ),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide: BorderSide(
          //       color: Theme.of(context).disabledColor,
          //     )),
          // labelStyle: new TextStyle(color: Colors.white),
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontFamily: "SfUiDisplay",
              fontSize: 14,
              color: Theme.of(context).disabledColor,
              fontWeight: FontWeight.w400),
          // contentPadding: const EdgeInsets.only(top: 15, left: 15),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
