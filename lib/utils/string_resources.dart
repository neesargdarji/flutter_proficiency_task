// ignore_for_file: constant_identifier_names

import '../utils/app_state.dart';

AppState appState = AppState();
bool iHealthAuthorized = false;

class StringRes {
  static const String appName = 'FLUTTER DEMO TASK';

  static const String someThingWentWrong =
      'Something went wrong. Please try again later.';
  static const String cancel = "Cancel";
  static const String connectionTimeout = "Connection Timed Out";
  static const String receiveTimeout = "Received Time out";
  static const String sendTimeout = "Send Time out";

  // SPLASH SCREEN
  static const String welcomeGreet = "Hi Welcome. How are you doing?";
}
