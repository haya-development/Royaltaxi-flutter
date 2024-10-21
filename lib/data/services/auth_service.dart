import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_colored_print/flutter_colored_print.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:royaltaxi/data/models/user.dart' as model;
import 'package:royaltaxi/generated/codegen_loader.g.dart';
import 'package:royaltaxi/utils/helper.dart';
import 'package:royaltaxi/utils/toaster.dart';

import 'api_service.dart';

class AuthService extends ApiService {
  static AuthService? _instance;

  static AuthService get instance => _instance ??= AuthService._();

  AuthService._();

  bool get isAuthed {
    var token = getUserToken();
    return !token.isEmptyOrNull;
  }

  String? _verificationId; // To store the verification ID

  // Function to initiate phone number verification
  Future<void> verifyPhoneNumber(String phone) async {
    return await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval of OTP is complete
        if (navigatorKey.currentState!.context.mounted) {
          navigatorKey.currentState!.context.loaderOverlay.show();
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);
            Toaster.showSuccess(
                context: navigatorKey.currentState!.context,
                text: LocaleKeys.otp_verified_successfully.tr());
          } catch (e) {
            Toaster.showError(
                context: navigatorKey.currentState!.context,
                text: LocaleKeys.error_while_authenticating.tr());
          }

          navigatorKey.currentState!.context.loaderOverlay.hide();
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        // Show error if verification fails
        Toaster.showError(
            context: navigatorKey.currentState!.context,
            text: LocaleKeys.error_while_send_otp.tr());
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID for later use
        _verificationId = verificationId;
        Toaster.showSuccess(
            context: navigatorKey.currentState!.context,
            text: LocaleKeys.otp_sent_successfully.tr());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle code auto-retrieval timeout
        _verificationId = verificationId;
      },
    );
  }

  // Function to verify the OTP entered by the user
  Future verifyOtp(String otp) async {
    if (_verificationId == null) {
      Toaster.showError(
          context: navigatorKey.currentState!.context,
          text: LocaleKeys.verification_id_not_found.tr());
      return;
    }

    try {
      // Create a PhoneAuthCredential with the OTP
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      // Sign in with the created credential
      var user = await FirebaseAuth.instance.signInWithCredential(credential);

      if (navigatorKey.currentState!.context.mounted) {
        Toaster.showSuccess(
            context: navigatorKey.currentState!.context,
            text: LocaleKeys.otp_verified_successfully.tr());
      }

      return user.credential?.accessToken;
    } catch (e) {
      // Show error if the OTP verification fails
      Toaster.showError(
          context: navigatorKey.currentState!.context,
          text: LocaleKeys.invalid_otp.tr());
    }
  }

  /// Checks if a rider exists using their identifier.
  ///
  /// [riderPhone] is the unique identifier of the rider.
  /// Returns a message indicating the success or failure of the request.
  Future<bool> checkRiderExists(String riderPhone) async {
    String url = "rider/exists/$riderPhone";
    var response = await get(url, auth: true);
    primary(response);
    return response != null;
  }

  /// Registers a new rider.
  ///
  /// [name] is the rider's name.
  /// [gender] is the rider's gender.
  /// [filePath] is the path to the rider's file for upload.
  /// Returns a message indicating if the rider was created successfully.
  Future<bool> createNewRider(model.User user) async {
    String url = "rider";

    var fields = user.toJson();
    fields.removeWhere(
      (key, value) => value == null,
    );
    var files = <http.MultipartFile>[];
    if (!(fields["file"] as String?).isEmptyOrNull) {
      files.add(await http.MultipartFile.fromPath('file', fields["file"]));
    }

    var response = await multipart(url, files, fields);
    primary(response);

    return response != null;
  }
}
