// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:todo/MVC/models.dart';

import 'UI/Screens.dart';


/*final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future selectNotification(String? payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }

}

Future<void> addNotification(TaskModel model)async{


  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'icon',
    //sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
    largeIcon: DrawableResourceAndroidBitmap('icon'),
  );


  var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.schedule(model.id, model.title, 'you have a task now',
      model.dateTime, platformChannelSpecifics);



}

Future<void> removeNotification(int id) async{
  await flutterLocalNotificationsPlugin.cancel(id);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('icon');


  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);
  runApp( MyApp());
}*/
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: Home(),
    );
  }
}

