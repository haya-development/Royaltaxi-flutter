
import 'package:flutter/material.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/utils/helper.dart';

class ChooseDestinationScreen extends StatefulWidget {
  const ChooseDestinationScreen({super.key});

  @override
  State<ChooseDestinationScreen> createState() =>
      _ChooseDestinationScreenState();
}

class _ChooseDestinationScreenState extends State<ChooseDestinationScreen> {
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
                    Assets.imagesS9,
                    height: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        Assets.imagesS21,
                        height: 55,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "874 Hildegard Crossing",
                              style: TextStyle(
                                  fontFamily: "SfUiDisplay",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: HexColor("E4E9F2"),
                            ),
                            Text(
                              "Enter Destionation",
                              style: TextStyle(
                                  fontFamily: "SfUiDisplay",
                                  fontSize: 14,
                                  color: Theme.of(context).disabledColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      // goTo(SetDestionationOnMapScreen());
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: HexColor("#EDF1F7"),
                          radius: 22,
                          child: Image.asset(
                            Assets.imagesS22,
                            height: 16,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Pick on map",
                          style: TextStyle(
                            fontFamily: "SfUiDisplay",
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Divider(
                          color: HexColor("E4E9F2"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      // goTo(MyFavoritesScreen());
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: HexColor("#EDF1F7"),
                          radius: 22,
                          child: Image.asset(
                            Assets.imagesS23,
                            height: 16,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My favorites",
                          style: TextStyle(
                            fontFamily: "SfUiDisplay",
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          Assets.imagesS19,
                          height: 15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  com("University of Washington",
                      "056 Coralie Mountains Apt. 567"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Divider(
                          color: HexColor("E4E9F2"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  com("Woodland Park", "371 Keshawn Knolls Suite 703"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Divider(
                          color: HexColor("E4E9F2"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  com("Woodland Park", "105 William St, Chicago, US"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Divider(
                          color: HexColor("E4E9F2"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String tex1, String tex2) {
    return Row(
      children: [
        Image.asset(
          Assets.imagesS24,
          height: 25,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tex1,
              style: TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 16,
              ),
            ),
            Text(
              tex2,
              style: TextStyle(
                  fontFamily: "SfUiDisplay",
                  fontSize: 14,
                  color: Theme.of(context).disabledColor),
            ),
          ],
        ),
      ],
    );
  }
}
