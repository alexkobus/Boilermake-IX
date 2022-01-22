// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDq8Qj4QBs6-bLesBKpt5TQMSHEMHbOUEk',
    appId: '1:525794142821:android:7b632830e424646b36f48c',
    messagingSenderId: '525794142821',
    projectId: 'thoughtify-b43ae',
    storageBucket: 'thoughtify-b43ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOc44nGbhKkXKhArstdm22g8RBooE6EHE',
    appId: '1:525794142821:ios:f7e5aa073cde76db36f48c',
    messagingSenderId: '525794142821',
    projectId: 'thoughtify-b43ae',
    storageBucket: 'thoughtify-b43ae.appspot.com',
    iosClientId: '525794142821-m43v4h7p7u07dt87v74cleg918kn6kst.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.flutter.app',
  );
}