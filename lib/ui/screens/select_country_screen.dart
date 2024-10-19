import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/generated/codegen_loader.g.dart';
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
            _buildBackButton(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 20),
                  _buildSearchField(),
                  const SizedBox(height: 40),
                  _buildCountryItem(LocaleKeys.iraq.tr(), LocaleKeys.iraq_code.tr()),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Back button with navigation
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

  // Title for the screen
  Widget _buildTitle() {
    return Text(
      LocaleKeys.select_country.tr(),
      style: const TextStyle(
        fontFamily: "SfUiDisplay",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Search field for countries
  Widget _buildSearchField() {
    return MyTextFieldWidget(
      hintText: LocaleKeys.search_country.tr(),
      prefixIcon: IconButton(
        icon: Image.asset(
          Assets.imagesS8,
          height: 15,
        ),
        onPressed: () {},
      ),
      click: () {},
    );
  }

  // Country item widget
  Widget _buildCountryItem(String countryName, String countryCode) {
    return Row(
      children: [
        Text(
          countryName,
          style: const TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8), // Added space between the country and the code
        Text(
          countryCode,
          style: TextStyle(
            fontFamily: "SfUiDisplay",
            fontSize: 15,
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
