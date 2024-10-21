// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:royaltaxi/data/services/auth_service.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/generated/codegen_loader.g.dart';
import 'package:royaltaxi/ui/screens/home_screen.dart';
import 'package:royaltaxi/ui/screens/login_screen.dart';
import 'package:royaltaxi/ui/screens/signup_screen.dart';
import 'package:royaltaxi/utils/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildBackgroundImage(context),
          _buildLogoAndAppName(),
          _buildStartNowButton(),
        ],
      ),
    );
  }

  /// Builds the background image for the splash screen
  Widget _buildBackgroundImage(BuildContext context) {
    return Image.asset(
      Assets.imagesS2,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }

  /// Builds the logo and app name section
  Widget _buildLogoAndAppName() {
    return Positioned(
      top: 120,
      child: Column(
        children: [
          Image.asset(
            Assets.imagesS1,
            height: 150,
          ),
          Text(
            LocaleKeys.app_name.tr(),
            style: TextStyle(
              fontFamily: "SfUiDisplay",
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the "Start Now" button at the bottom
  Widget _buildStartNowButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: InkWell(
        onTap: () {
          if(AuthService.instance.isAuthed){
            goTo(HomeScreen());
          }else{
            goTo(LoginScreen());
          }
        },
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              LocaleKeys.start_now.tr(),
              style: TextStyle(
                fontFamily: "SfUiDisplay",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
