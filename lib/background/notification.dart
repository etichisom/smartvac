import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smartvac/services/socket.dart';

void showNotification( String g, flp) async {
  var android = AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.high, importance: Importance.max);
  var iOS = IOSNotificationDetails();
  var platform = NotificationDetails(android: android,iOS: iOS);
  await flp.show(0, 'Smartvac Reminder', g, platform,
      payload: 'VIS chisom');
}
