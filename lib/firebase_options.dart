// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAO5Cddk9X1rvL3VrjCtZXOpfMknvuBti8',
    appId: '1:428156076196:web:955ddd57f001e5ea322631',
    messagingSenderId: '428156076196',
    projectId: 'luvasi',
    authDomain: 'luvasi.firebaseapp.com',
    storageBucket: 'luvasi.appspot.com',
    measurementId: 'G-W2BY9C66P9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATo7rqsQCJRgsXx7cKHw7jtLn8XN3mOfU',
    appId: '1:428156076196:android:0ac4a795489d261b322631',
    messagingSenderId: '428156076196',
    projectId: 'luvasi',
    storageBucket: 'luvasi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbOUVT0rnyKJIp8wrJBzP1hk5apC1O3Rg',
    appId: '1:428156076196:ios:ff9d9448769a1de1322631',
    messagingSenderId: '428156076196',
    projectId: 'luvasi',
    storageBucket: 'luvasi.appspot.com',
    iosBundleId: 'com.example.luvasi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbOUVT0rnyKJIp8wrJBzP1hk5apC1O3Rg',
    appId: '1:428156076196:ios:ff9d9448769a1de1322631',
    messagingSenderId: '428156076196',
    projectId: 'luvasi',
    storageBucket: 'luvasi.appspot.com',
    iosBundleId: 'com.example.luvasi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAO5Cddk9X1rvL3VrjCtZXOpfMknvuBti8',
    appId: '1:428156076196:web:58b315b1e5ae5594322631',
    messagingSenderId: '428156076196',
    projectId: 'luvasi',
    authDomain: 'luvasi.firebaseapp.com',
    storageBucket: 'luvasi.appspot.com',
    measurementId: 'G-CWYCT7TH6X',
  );
}
