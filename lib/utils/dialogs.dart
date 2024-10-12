import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import 'package:new_version_plus/new_version_plus.dart';
import 'package:royaltaxi/data/config/config.dart';
import 'package:royaltaxi/generated/assets.dart';
import 'package:royaltaxi/generated/codegen_loader.g.dart';
import 'package:royaltaxi/utils/widgets.dart';


checkVersion() async {
  final newVersion = NewVersionPlus();

  var status = await newVersion.getVersionStatus();

  if (status != null && status.canUpdate) {
    if (nb.navigatorKey.currentState?.context != null &&
        nb.navigatorKey.currentState!.context.mounted) {
      AwesomeDialog(
              dialogType: DialogType.info,
              context: nb.navigatorKey.currentState!.context,
              title: LocaleKeys.update.tr(),
              desc: LocaleKeys.update_your_app.tr(namedArgs: {
                "from": status.localVersion,
                "to": status.storeVersion
              }),
              btnCancelOnPress: () {},
              btnOkText: LocaleKeys.yes.tr(),
              btnCancelText: LocaleKeys.no.tr(),
              btnOkOnPress: () {
                InAppReview.instance.openStoreListing();
              })
          .show();
    }
  }
}

confirmTermsAnPrivacy(context) async {
  bool confirmed =
      nb.getBoolAsync('terms_and_privacy_confirmed', defaultValue: false);
  if (!confirmed) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      title: LocaleKeys.confirm.tr(),
      useRootNavigator: true,
      body: SizedBox(
        height: 300.dynamicHeight,
        child: buildWebViewWidget(Config.termsUrl),
      ),
      btnOkOnPress: () async {
        nb.setValue('terms_and_privacy_confirmed', true);
      },
      btnOkText: LocaleKeys.yes.tr(),
      btnCancelText: LocaleKeys.no.tr(),
      btnCancelOnPress: () {
        SystemNavigator.pop(animated: true);
      },
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
    ).show();
  }
}

aboutDialog(context) async {
  var info = await nb.getPackageInfo();
  showAboutDialog(
    context: context,
    applicationIcon: Image.asset(Assets.imagesLogo ,height: 50,width: 50,),
    applicationName: "${LocaleKeys.app_name.tr()} (Fun Zone Ent. Group)",
    applicationVersion: "${info.versionName} (${info.versionCode})",
    children: [
      SizedBox(
        height: 400,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: buildWebViewWidget(Config.aboutUrl),
        ),
      ),
    ],
  );
}

privacyDialog(context) async {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    title: LocaleKeys.privacy.tr(),
    useRootNavigator: true,
    body: SizedBox(
      height: 300.dynamicHeight,
      child: buildWebViewWidget(Config.privacyUrl),
    ),
    btnOkText: LocaleKeys.yes.tr(),
    btnOkOnPress: (){}
  ).show();
}
