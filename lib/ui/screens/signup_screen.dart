import 'package:flutter/material.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/ui/screens/login_screen.dart';
import 'package:royaltaxi/ui/screens/select_country_screen.dart';
import 'package:royaltaxi/ui/widgets/my_button_widget.dart';
import 'package:royaltaxi/ui/widgets/my_text_field_widget.dart';
import 'package:royaltaxi/utils/helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {
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
                    "Create your account",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            fontFamily: "SfUiDisplay",
                            fontSize: 12,
                            color: Theme.of(context).disabledColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Log in",
                        style: TextStyle(
                            fontFamily: "SfUiDisplay",
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextFieldWidget(hintText: "Enter your email", click: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontFamily: "SfUiDisplay",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MyTextFieldWidget(
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        icon: Image.asset(
                          Assets.imagesS7,
                          height: 25,
                        ),
                        onPressed: () {},
                      ),
                      click: () {}),
                  SizedBox(
                    height: 20,
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
                      btnName: "Sign up",
                      click: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            fontFamily: "SfUiDisplay",
                            fontSize: 12,
                            color: HexColor("#ACB1C0"),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: HexColor("#3B5A99"),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.imagesS5,
                              height: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                  fontFamily: "SfUiDisplay",
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.imagesS6,
                              height: 25,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Twitter",
                              style: TextStyle(
                                  fontFamily: "SfUiDisplay",
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By clicking' Sign Up' you agree to our ",
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
}
