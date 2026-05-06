import 'storage_service.dart';

class SessionService {
  static const int sessionMinutes = 5;

  static Future<bool> isSessionValid() async {
    final loginTime = await StorageService.getLoginTime();

    if (loginTime == null) {
      return false;
    }

    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final difference = currentTime - loginTime;

    final minutes = difference ~/ (1000 * 60);

    return minutes < sessionMinutes;
  }
}
