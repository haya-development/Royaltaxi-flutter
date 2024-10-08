import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:royaltaxi/generated/l10n.dart';
import 'package:royaltaxi/ui/widgets/back_button_widget.dart';
import 'package:royaltaxi/ui/widgets/user_avatar_widget.dart';
import 'package:royaltaxi/utils/custom_theme.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Static data for display
    const String mobileNumber = "+123456789";
    const String firstName = "John";
    const String lastName = "Doe";
    const String email = "johndoe@example.com";
    const Gender gender = Gender.male;

    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButtonWidget(text: S.of(context).action_back),
                    const Spacer(),
                    PopupMenuButton(itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text(S.of(context).action_delete_account),
                          onTap: () {
                            Future.delayed(
                                const Duration(seconds: 0),
                                    () => showDialog(
                                    context: context,
                                    builder: (BuildContext ncontext) {
                                      return AlertDialog(
                                        title: Text(S
                                            .of(context)
                                            .message_delete_account_title),
                                        content: Text(S
                                            .of(context)
                                            .message_delete_account_body),
                                        actions: [
                                          Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.popUntil(context,
                                                            (route) => route.isFirst);
                                                  },
                                                  child: Text(
                                                    S.of(context)
                                                        .action_delete_account,
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                        color:
                                                        Color(0xffb20d0e)),
                                                  )),
                                              const Spacer(),
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: Text(
                                                    S
                                                        .of(context)
                                                        .action_cancel,
                                                    textAlign: TextAlign.end,
                                                  ))
                                            ],
                                          ),
                                        ],
                                      );
                                    }));
                          },
                        )
                      ];
                    })
                  ],
                ),
                SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(height: 16),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: UserAvatarWidget(
                              urlPrefix: "https://example.com/", // Static image URL
                              url: "/static/profile.jpg", // Replace with your image path
                              cornerRadius: 10,
                              size: 50,
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: CustomTheme.primaryColors.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.add,
                                  color: CustomTheme.neutralColors.shade500,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        mobileNumber,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      CupertinoButton(
                          minSize: 0,
                          padding:
                          const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                          child: Text(S.of(context).action_add_photo),
                          onPressed: () {
                            // Do nothing, or show a static action
                          }),
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            initialValue: firstName,
                            decoration: InputDecoration(
                                labelText: S.of(context).profile_firstname,
                                fillColor: CustomTheme.primaryColors.shade100),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue: lastName,
                            decoration: InputDecoration(
                                fillColor: CustomTheme.primaryColors.shade100,
                                labelText: S.of(context).profile_lastname),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue: email,
                            decoration: InputDecoration(
                                fillColor: CustomTheme.primaryColors.shade100,
                                labelText: S.of(context).profile_email),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField<Gender>(
                            value: gender,
                            decoration: InputDecoration(
                                fillColor: CustomTheme.primaryColors.shade100,
                                labelText: S.of(context).profile_gender),
                            icon: const Icon(Ionicons.chevron_down),
                            items: <DropdownMenuItem<Gender>>[
                              DropdownMenuItem(
                                  value: Gender.male,
                                  child: Row(
                                    children: [
                                      Text(S.of(context).enum_gender_male),
                                    ],
                                  )),
                              DropdownMenuItem(
                                  value: Gender.female,
                                  child: Text(S.of(context).enum_gender_female)),
                              DropdownMenuItem(
                                  value: Gender.unknown,
                                  child: Text(S.of(context).enum_gender_unknown))
                            ],
                            onChanged: (Gender? value) {
                              // Do nothing, static gender
                            },
                          ),
                        ]),
                      ),
                    ])),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          child: Text(S.of(context).action_save),
                          onPressed: () {
                            // Save action (do nothing in static mode)
                          },
                        ))
                  ],
                )
              ],
            )));
  }
}

enum Gender { male, female, unknown }
