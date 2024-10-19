import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:royaltaxi/data/services/auth_service.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/generated/codegen_loader.g.dart';
import 'package:royaltaxi/ui/screens/select_country_screen.dart';
import 'package:royaltaxi/ui/screens/verify_phone_number_screen.dart';
import 'package:royaltaxi/ui/widgets/my_button_widget.dart';
import 'package:royaltaxi/ui/widgets/my_text_field_widget.dart';
import 'package:royaltaxi/utils/navigate.dart';
import 'package:royaltaxi/utils/toaster.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LoginScreen> {
  TextEditingController loginController = TextEditingController();

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
            _buildBackButton(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 30),
                  _buildPhoneNumberField(context),
                  const SizedBox(height: 30),
                  _buildSignInButton(),
                  const SizedBox(height: 20),
                  _buildAgreementTexts(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Back button with pop navigation
  Widget _buildBackButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Image.asset(
            Assets.imagesS3,
            height: 18,
          ),
        ],
      ),
    );
  }

  // Welcome back and subtitle text
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.welcome_back.tr(),
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          LocaleKeys.sign_in_to_account.tr(),
          style: TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 12,
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Phone number input field
  Widget _buildPhoneNumberField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.phone_number.tr(),
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        MyTextFieldWidget(
          controller: loginController,
          hintText: LocaleKeys.mobile_number.tr(),
          prefixIcon: IconButton(
            icon: Image.asset(
              Assets.imagesS4,
              height: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SelectCountryScreen(),
                ),
              );
            },
          ),
          click: () {},
        ),
      ],
    );
  }

  // Sign-in button with verification logic
  Widget _buildSignInButton() {
    return MyButtonWidget(
      btnName: LocaleKeys.sign_in.tr(),
      click: () async {
        if (loginController.text.isEmptyOrNull) {
          Toaster.showError(
            context: context,
            text: LocaleKeys.phone_is_required.tr(),
          );
          return;
        }

        await AuthService.instance.verifyPhoneNumber("+20${loginController.text}");
        goTo(VerifyPhoneNumberScreen(phone: "+20${loginController.text}"));
      },
    );
  }

  // Terms and agreement text
  Widget _buildAgreementTexts() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.agree_to_terms.tr(),
              style: const TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.terms_and_conditions.tr(),
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
              LocaleKeys.as_well_as_our.tr(),
              style: const TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 12,
              ),
            ),
            Text(
              LocaleKeys.privacy_policy.tr(),
              style: TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 14,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
