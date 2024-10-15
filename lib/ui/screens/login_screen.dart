import 'package:flutter/material.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/ui/screens/select_country_screen.dart';
import 'package:royaltaxi/ui/screens/verify_phone_number_screen.dart';
import 'package:royaltaxi/ui/widgets/my_button_widget.dart';
import 'package:royaltaxi/ui/widgets/my_text_field_widget.dart';
import 'package:royaltaxi/utils/navigate.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LoginScreen> {
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
                    "Welcome back, Guy!",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                            fontFamily: "SfUiDisplay",
                            fontSize: 12,
                            color: Theme.of(context).disabledColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Phone number",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextFieldWidget(
                      hintText: "Mobile number",
                      prefixIcon: IconButton(
                        icon: Image.asset(
                          Assets.imagesS4,
                          height: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SelectCountryScreen(),
                            ),
                          );
                        },
                      ),
                      click: () {}),
                  SizedBox(
                    height: 30,
                  ),
                  MyButtonWidget(
                      btnName: "Sign In",
                      click: () {
                        goTo(const VerifyPhoneNumberScreen());
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By clicking' Sign in' you agree to our ",
                        style: TextStyle(
                          fontFamily: "SfUiDisplay",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " terms and conditions",
                        style: TextStyle(
                          fontFamily: "SfUiDisplay",
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " as well as our",
                        style: TextStyle(
                          fontFamily: "SfUiDisplay",
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        " privacy policy",
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
