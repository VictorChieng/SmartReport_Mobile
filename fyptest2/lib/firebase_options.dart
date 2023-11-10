// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
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
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCujMcbsFY4leYE-q2lQG_Cm9eMRD_PWRk',
    appId: '1:769752664985:web:46b0c0ab3528c3b9b5e108',
    messagingSenderId: '769752664985',
    projectId: 'smartreport-272fa',
    authDomain: 'smartreport-272fa.firebaseapp.com',
    storageBucket: 'smartreport-272fa.appspot.com',
    measurementId: 'G-WWHMBE29LT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3CUq6DRQTMFQw_CSU-P2PoYFr8UX4a8A',
    appId: '1:769752664985:android:5bba5d276010d459b5e108',
    messagingSenderId: '769752664985',
    projectId: 'smartreport-272fa',
    storageBucket: 'smartreport-272fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGmK33t5GZjJLtven2_1-2NtzybR5Typ8',
    appId: '1:769752664985:ios:330d27e1df09dcc5b5e108',
    messagingSenderId: '769752664985',
    projectId: 'smartreport-272fa',
    storageBucket: 'smartreport-272fa.appspot.com',
    iosBundleId: 'com.example.fyptest1',
  );
}