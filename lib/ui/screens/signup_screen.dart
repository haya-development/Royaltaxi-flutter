import 'package:flutter/material.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:royaltaxi/ui/screens/login_screen.dart';
import 'package:royaltaxi/ui/widgets/my_button_widget.dart';
import 'package:royaltaxi/ui/widgets/my_text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  final String phone;
  const SignupScreen({super.key, required this.phone});

  @override
  State<SignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {

  @override
  void initState() {
    super.initState();
  }
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
                  _buildNameField(),
                  const SizedBox(height: 20),
                  _buildGenderField(),
                  const SizedBox(height: 20),
                  _buildPhoneField(), // Read-only phone field
                  const SizedBox(height: 30),
                  _buildSignupButton(),
                  const SizedBox(height: 20),
                  _buildTermsText(),
                  const SizedBox(height: 20),
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
      onTap: () => Navigator.pop(context),
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

  // Screen title
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.create_account.tr(), // Use LocaleKeys for translation
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              LocaleKeys.already_have_account.tr(), // Use LocaleKeys
              style: TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 12,
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
              child: Text(
                LocaleKeys.log_in.tr(), // Use LocaleKeys
                style: TextStyle(
                  fontFamily: "SfUiDisplay",
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  // Name input field
  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.name.tr(), // Use LocaleKeys
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        MyTextFieldWidget(
          hintText: LocaleKeys.enter_name.tr(), // Use LocaleKeys
          click: () {},
        ),
      ],
    );
  }

  // Gender dropdown field
  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.gender.tr(), // Use LocaleKeys
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          items: [
            DropdownMenuItem(value: 'male', child: Text(LocaleKeys.male1.tr())), // Use LocaleKeys
            DropdownMenuItem(value: 'female', child: Text(LocaleKeys.female1.tr())), // Use LocaleKeys
          ],
          onChanged: (value) {},
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  // Read-only Phone number input field
  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.phone_number.tr(), // Use LocaleKeys
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        MyTextFieldWidget(
          value:widget.phone,
          hintText: LocaleKeys.phone_number.tr(), // Use LocaleKeys
          readOnly: true, // Phone is readonly
          click: () {},
        ),
      ],
    );
  }

  // Sign-up button
  Widget _buildSignupButton() {
    return MyButtonWidget(
      btnName: LocaleKeys.sign_up.tr(), // Use LocaleKeys
      click: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      },
    );
  }

  // Terms and conditions text
  Widget _buildTermsText() {
    return Column(
      children: [
        Text(
          LocaleKeys.agree_to_terms.tr(), // Use LocaleKeys
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {},
          child: Text(
            LocaleKeys.terms_and_conditions.tr(), // Use LocaleKeys
            style: TextStyle(
              fontFamily: "SfUiDisplay",
              fontSize: 14,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.as_well_as_our.tr(), // Use LocaleKeys
              style: const TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 12,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                LocaleKeys.privacy_policy.tr(), // Use LocaleKeys
                style: TextStyle(
                  fontFamily: "SfUiDisplay",
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
