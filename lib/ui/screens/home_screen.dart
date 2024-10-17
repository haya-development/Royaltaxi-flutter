import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/generated/codegen_loader.g.dart';
import 'package:royaltaxi/ui/screens/choose_destination_screen.dart';
import 'package:royaltaxi/ui/screens/login_screen.dart';
import 'package:royaltaxi/ui/widgets/my_text_field_widget.dart';
import 'package:royaltaxi/utils/helper.dart';
import 'package:royaltaxi/utils/navigate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(), // Main drawer (left side)
      endDrawer: _buildEndDrawer(), // End drawer (right side) with ChooseDestinationScreen
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildBackground(context),
          _buildDestinationInput(context),
        ],
      ),
    );
  }

  // Build the main drawer (left drawer)
  Widget _buildDrawer() {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: Column(
          children: [
            _buildDrawerHeader(),
            const SizedBox(height: 30),
            const Divider(color: Color(0xFFE4E9F2)),
            const SizedBox(height: 30),
            _buildDrawerItems(),
            const Spacer(),
            InkWell(
              onTap: () => goTo(const LoginScreen()),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.logout.tr(), // Localized Logout
                    style: TextStyle(
                      fontFamily: "SfUiDisplay",
                      fontSize: 16,
                      color: Theme.of(context).disabledColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  // Build the end drawer (right drawer) with ChooseDestinationScreen
  Widget _buildEndDrawer() {
    return const Drawer(
      child: ChooseDestinationScreen(),
    );
  }

  // Drawer header with user info
  Widget _buildDrawerHeader() {
    return Row(
      children: [
        Image.asset(Assets.imagesS14, height: 60),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Travis Reeves",
              style: TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () => _openEditProfileBottomSheet(context),
              child: Text(
                LocaleKeys.edit_profile.tr(), // Localized Edit profile
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

  // Drawer items list
  Widget _buildDrawerItems() {
    final List<Map<String, dynamic>> items = [
      {"title": LocaleKeys.your_trips.tr(), "onTap": () {}},
      {"title": LocaleKeys.payment.tr(), "onTap": () {}},
      {"title": LocaleKeys.notifications.tr(), "onTap": () {}},
      {"title": LocaleKeys.promos.tr(), "onTap": () {}},
      {"title": LocaleKeys.help.tr(), "onTap": () {}},
      {"title": LocaleKeys.free_trips.tr(), "onTap": () {}},
      {"title": LocaleKeys.settings.tr(), "onTap": () {}},
    ];

    return Column(
      children: items.map((item) {
        return InkWell(
          onTap: item['onTap'],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              item['title'],
              style: const TextStyle(
                fontFamily: "SfUiDisplay",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Background map and top icons
  Widget _buildBackground(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        InkWell(
          onTap: () => _scaffoldKey.currentState!.openEndDrawer(), // Open the end drawer when the map is tapped
          child: Image.asset(
            Assets.imagesS11,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: MediaQuery.of(context).padding.top + 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                child: Image.asset(Assets.imagesS13, height: 40),
              ),
              Image.asset(Assets.imagesS14, height: 40),
            ],
          ),
        ),
      ],
    );
  }

  // Destination input field
  Widget _buildDestinationInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).padding.bottom + 50,
      ),
      child: MyTextFieldWidget(
        hintText: LocaleKeys.where_are_you_going.tr(), // Localized placeholder
        prefixIcon: IconButton(
          icon: Image.asset(Assets.imagesS15, height: 20),
          onPressed: () {},
        ),
        click: () {},
      ),
    );
  }

  // Bottom sheet for editing profile
  void _openEditProfileBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: MediaQuery.of(context).padding.top + 20,
          ),
          children: [
            _buildEditProfileHeader(),
            const SizedBox(height: 30),
            _buildSocialNetworks(),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }

  // Edit profile header
  Widget _buildEditProfileHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                color: HexColor("#EAECEF"),
                borderRadius: BorderRadius.circular(15),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Image.asset(Assets.imagesS14, height: 60),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Travis Reeves",
                  style: TextStyle(
                    fontFamily: "SfUiDisplay",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "(+1) 080-744-5078",
                  style: TextStyle(
                    fontFamily: "SfUiDisplay",
                    fontSize: 14,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(Assets.imagesS20, height: 20),
          ],
        ),
      ],
    );
  }

  // Social networks section
  Widget _buildSocialNetworks() {
    return Column(
      children: [
        _buildSocialNetworkButton(
          color: HexColor("#3B5A99"),
          icon: Assets.imagesS5,
          label: "Facebook",
        ),
        const SizedBox(height: 10),
        _buildSocialNetworkButton(
          color: Theme.of(context).primaryColor,
          icon: Assets.imagesS6,
          label: "Twitter",
        ),
      ],
    );
  }

  // Reusable social network button
  Widget _buildSocialNetworkButton({required Color color, required String icon, required String label}) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontFamily: "SfUiDisplay",
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
