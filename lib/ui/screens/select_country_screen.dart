
import 'package:flutter/material.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/ui/widgets/my_text_field_widget.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Image.asset(
                    Assets.imagesS3,
                    height: 18,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                    Text(
                      "Select a country",
                      style: TextStyle(
                          fontFamily: "SfUiDisplay",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextFieldWidget(
                      hintText: "Search for a country",
                      prefixIcon: IconButton(
                        icon: Image.asset(
                          Assets.imagesS8,
                          height: 15,
                        ),
                        onPressed: () {},
                      ),
                      click: () {}),
                  SizedBox(
                    height: 40,
                  ),
                  com("Afghanistan", " (+93)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Albania", " (+355)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Algeria", " (+213)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("American samon", " (+1684)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Andorra", " (+376)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Angola", " (+244)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Anguilla", " (+1264)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Antigua \$ Barbuda", " (+244)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Argentina", " (+54)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Armenia", " (+374)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Aruba", " (+297)"),
                  SizedBox(
                    height: 20,
                  ),
                  com("Australia", " (+61)"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String tex1, Text2) {
    return Row(
      children: [
        Text(
          tex1,
          style: TextStyle(
              fontFamily: "SfUiDisplay",
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        Text(
          Text2,
          style: TextStyle(
              fontFamily: "SfUiDisplay",
              fontSize: 15,
              color: Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
