import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/ui/widgets/my_button_widget.dart';
import 'package:royaltaxi/utils/navigate.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({super.key});

  @override
  State<VerifyPhoneNumberScreen> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumberScreen> {
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
                    "Verify phone number",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Check your SMS messages. We've sent you the PIN at",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 12,
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    " (+1) 080-744-5078",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  OtpTextField(
                    numberOfFields: 4,
                    focusedBorderColor: Theme.of(context).primaryColor,
                    showFieldAsBox: true,
                    fieldWidth: 65,
                    autoFocus: true,
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                    // fillColor: HexColor("#FAFAFC"),
                    keyboardType: TextInputType.number,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MyButtonWidget(
                      btnName: "Verify",
                      click: () {
                        // goTo(EnableLocationScreen());
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive SMS?",
                        style: TextStyle(
                          fontFamily: "SfUiDisplay",
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "  Resend Code",
                        style: TextStyle(
                          fontFamily: "SfUiDisplay",
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
