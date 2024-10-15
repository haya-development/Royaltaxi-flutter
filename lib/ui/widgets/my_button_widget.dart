
import 'package:flutter/material.dart';
import 'package:royaltaxi/utils/helper.dart';

class MyButtonWidget extends StatefulWidget {
  final String btnName;
  final VoidCallback click;
  const MyButtonWidget({
    super.key,
    required this.btnName,
    required this.click,
  });

  @override
  State<MyButtonWidget> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.click();
      },
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isLightTheme()
                  ? Color.fromARGB(255, 217, 237, 246)
                  : Colors.transparent,
              blurRadius: 10,
              spreadRadius: 5.0,
              offset: Offset(
                0.0,
                10,
              ),
            )
          ],
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment(0.8, 1),
          //   colors: <Color>[
          //     HexColor("#1CE0DA"),
          //     HexColor("#479DE4"),
          //   ],
          // ),
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            widget.btnName,
            style: TextStyle(
                fontFamily: "SfUiDisplay",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
