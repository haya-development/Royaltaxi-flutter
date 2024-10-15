import 'package:in_app_review/in_app_review.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:royaltaxi/data/config/config.dart';
import 'package:share_plus/share_plus.dart';


Future<bool> reviewApp() async {
  var isAvailable = await InAppReview.instance.isAvailable();
  if (isAvailable) {
    await InAppReview.instance.requestReview();
  }

  return !isAvailable;
}

openAppForReview() async {
  await InAppReview.instance.openStoreListing();
}

shareApp() async {
  String packageName = await getPackageName();

  var subject = "Config.shareSubject";
  String message =
      "${"Config.shareMessage"}\nhttps://play.google.com/store/apps/details?id=$packageName";
  Share.share(message, subject: subject);
}

