import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:royaltaxi/utils/custom_theme.dart';

class BackButtonWidget extends StatelessWidget {
  final String text;

  const BackButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Navigator.pop(context),
      minSize: 0,
      padding: const EdgeInsets.all(0),
      child: Stack(children: [
        Positioned(
          left: -7,
          child: Icon(
            Ionicons.chevron_back,
            color: CustomTheme.neutralColors.shade800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 16),
          child: Text(
            text,
            style: TextStyle(color: CustomTheme.neutralColors.shade800),
          ),
        )
      ]),
    );
  }
}
