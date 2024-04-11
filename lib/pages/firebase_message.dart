import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> setupFirebaseMessaging() async {
    // Запрос разрешения на уведомления (для iOS)
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission for notifications');
    } else {
      print('User declined permission for notifications');
    }

    // Обработка получения уведомлений
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: ${message.notification!.title}');
    });
  }
}
