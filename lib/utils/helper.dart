
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart' as nb;

/// get current locale language code
String getLanguageCode() {
  return nb.navigatorKey.currentContext?.locale.languageCode ?? "en";
}

/// get current user api token
String getUserToken() {
  return nb.getStringAsync("user_token", defaultValue: "");
}

/// set current user api token
Future<bool> setUserToken(String token) {
  return nb.setValue("user_token", token);
}

/// delete current user api token
Future<bool> deleteUserToken() {
  return nb.removeKey("user_token");
}

void logout(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: LocaleKeys.logout.tr(),
    desc: LocaleKeys.are_you_sure.tr(),
    btnCancelOnPress: () {},
    btnOkText: LocaleKeys.yes.tr(),
    btnCancelText: LocaleKeys.no.tr(),
    btnOkOnPress: () {
      deleteUserToken();
    },
  ).show();
}

/// get if app is rtl
bool isRTL() {
  return nb.navigatorKey.currentState?.overlay?.context.locale.languageCode
          .toLowerCase() ==
      "ar";
}

List<T>? getApiListData<T>(
    Map<String, dynamic>? data, T Function(Map<String, dynamic>) fromJson) {
  List<dynamic> dataList = data?['data'] ?? [];
  return dataList.map((item) => fromJson(item)).toList();
}

T? getApiObjectData<T>(
    Map<String, dynamic>? data, T Function(Map<String, dynamic> data) fromJson) {
  if(data == null){
    return null;
  }

  return fromJson(data['data'] ?? {});
}
