import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_colored_print/flutter_colored_print.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

/// notification
Future<void> initNotifications() async {
  if (getBoolAsync("notify" , defaultValue: true) == false) {
    return;
  }

  PermissionStatus status = await Permission.notification.status;
  if (!status.isGranted) {
    status = await Permission.notification.request();
  }

  FirebaseMessaging.instance.getToken().then((value){
    if(value.isEmptyOrNull == false) {
      setValue("fcm_user_token", value);
      // UserService.instance.updateUserFcmToken(value!);
    }
  });

  String allTopics = "all";
  FirebaseMessaging.instance.subscribeToTopic(allTopics);

  info("firebase messaging init");
  // get message when app opened from terminated
  FirebaseMessaging.instance.getInitialMessage().then((message) {

  });

  // get message on foreground and send notification
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    info(message.messageId);
    showNotification(message.notification?.title, message.notification?.body);
  });

  // get message from app opened from background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

  });

  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
}

showNotification(String? title, String? body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('0', 'fcm',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
          showWhen: false);

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("ic_launcher");
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await flutterLocalNotificationsPlugin.show(
      0, title, body, platformChannelSpecifics);
}

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {

}

Future<http.Response> sendNotification(String toToken ,String title , String body) async {
  String serverToken = ''; // Your FCM server token
  String projectID = ''; // Your FCM project ID


  // Construct the FCM message payload
  Map<String, dynamic> message = {
    "message": {
      'notification': {
        'body': body,
        'title': title,
      },
      'priority': 'high',
      'to': toToken,
    }
  };

  // Define request headers
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $serverToken',
  };

  // Construct FCM URL
  String fcmUrl = 'https://fcm.googleapis.com/v1/projects/$projectID/messages:send';

  // Send HTTP POST request
  http.Response response =
  await http.post(Uri.parse(fcmUrl), headers: headers, body: jsonEncode(message));

  return response;
}

