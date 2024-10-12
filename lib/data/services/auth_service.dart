import 'package:wisal/data/models/user.dart';
import 'package:wisal/utils/helper.dart';
import 'package:wisal/utils/navigate.dart';
import 'package:wisal/utils/toaster.dart';
import 'package:flutter_colored_print/flutter_colored_print.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'api_service.dart';

class AuthService extends ApiService {
  static AuthService? _instance;

  static AuthService get instance => _instance ??= AuthService._();

  AuthService._();

  Future<String?> googleLogin() async {
      GoogleSignIn googleSignIn = GoogleSignIn();
      var user = await googleSignIn.signIn();

      if(user == null){
        return null;
      }

      String url = "login/google";

      var response = await post(url, {
        "name": user.displayName,
        "email": user.email,
        "auth_code": user.serverAuthCode,
      } ,auth: false);

      if (response["success"] == true) {
        return response["data"];
      } else {
        if (appKey.currentState?.overlay?.context != null) {
          Toaster.showError(
              context: appKey.currentState!.overlay!.context,
              text: response["message"]);
        }
      }
    return null;
  }

  Future<bool?> requestOtp({countryCode, phone}) async {
    String url = "login/phone/request-otp/$countryCode/$phone";

    var response = await get(url, auth: false);

    primary(response);

    return response?["success"] == true;
  }

  Future<String?> verifyOtp(
      {String? countryCode, String? phone, required String pin}) async {
    String url = "login/phone/verify-otp/$countryCode/$phone?otp=$pin";

    var response = await get(url, auth: false);

    if (response["success"] == true) {
      return response["data"];
    } else {
      if (appKey.currentState?.overlay?.context != null) {
        Toaster.showError(
            context: appKey.currentState!.overlay!.context,
            text: response["message"]);
      }
    }
    return null;
  }

  Future<User?> getUserData() async {
    const String url = "login/user-data";

    var response = await get(url, auth: true);

    return getApiObjectData<User>(response, User.fromJson);
  }
}
