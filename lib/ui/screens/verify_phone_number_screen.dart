import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:royaltaxi/data/services/auth_service.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/generated/codegen_loader.g.dart';
import 'package:royaltaxi/ui/screens/home_screen.dart';
import 'package:royaltaxi/ui/widgets/my_button_widget.dart';
import 'package:royaltaxi/utils/navigate.dart';
import 'package:royaltaxi/utils/toaster.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  final String phone;
  const VerifyPhoneNumberScreen({super.key, required this.phone});

  @override
  State<VerifyPhoneNumberScreen> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumberScreen> {
  String? otp;

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
                  const SizedBox(height: 40),
                  _buildOtpField(),
                  const SizedBox(height: 40),
                  _buildVerifyButton(),
                  const SizedBox(height: 50),
                  _buildResendText(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Back button for navigation
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

  // Title and phone number text
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.verify_phone_number.tr(),
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          LocaleKeys.check_sms.tr(),
          style: TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 12,
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          widget.phone,
          style: TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 12,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // OTP text field
  Widget _buildOtpField() {
    return OtpTextField(
      numberOfFields: 6,
      focusedBorderColor: Theme.of(context).primaryColor,
      showFieldAsBox: true,
      fieldWidth: 40,
      autoFocus: true,
      textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).primaryColor,
        fontSize: 16,
      ),
      onSubmit: (value) {
        otp = value;
        _verifyOtp();
      },
      keyboardType: TextInputType.number,
      borderRadius: BorderRadius.circular(25),
    );
  }

  // Verify button
  Widget _buildVerifyButton() {
    return MyButtonWidget(
      btnName: LocaleKeys.verify.tr(),
      click: () async {
        if (otp.isEmptyOrNull) {
          Toaster.showError(
            context: context,
            text: LocaleKeys.please_enter_otp.tr(),
          );
          return;
        }
        await _verifyOtp();
      },
    );
  }

  // Text for "Did not receive SMS?" and "Resend Code"
  Widget _buildResendText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.did_not_receive_sms.tr(),
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
          ),
        ),
        Text(
          LocaleKeys.resend_code.tr(),
          style: TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 14,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  // Function to handle OTP verification logic
  Future<void> _verifyOtp() async {
    context.loaderOverlay.show();
    await AuthService.instance.verifyOtp(otp!);
    if (context.mounted) {
      context.loaderOverlay.hide();
    }
    goToRemove(const HomeScreen());
  }
}
