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
        return macos;
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
    apiKey: 'AIzaSyB_kilKp8S2PPE8XyTJ2S_eW8vVJ1JO4CU',
    appId: '1:815491788698:web:fb74879a11847c72b0d423',
    messagingSenderId: '815491788698',
    projectId: 'dalel-12a8f',
    authDomain: 'dalel-12a8f.firebaseapp.com',
    storageBucket: 'dalel-12a8f.appspot.com',
    measurementId: 'G-MX0V6YMT0G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeQwKm0AGe7rvSp8mK-J5-Vh6ePkM3ntU',
    appId: '1:815491788698:android:ca84523f61e5d563b0d423',
    messagingSenderId: '815491788698',
    projectId: 'dalel-12a8f',
    storageBucket: 'dalel-12a8f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGN8ZMbwZ8aZsSLixwF5XEe1LG9Ia6Ht0',
    appId: '1:815491788698:ios:04365d167f4865efb0d423',
    messagingSenderId: '815491788698',
    projectId: 'dalel-12a8f',
    storageBucket: 'dalel-12a8f.appspot.com',
    iosBundleId: 'com.example.dalel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGN8ZMbwZ8aZsSLixwF5XEe1LG9Ia6Ht0',
    appId: '1:815491788698:ios:f683af91a7cf098cb0d423',
    messagingSenderId: '815491788698',
    projectId: 'dalel-12a8f',
    storageBucket: 'dalel-12a8f.appspot.com',
    iosBundleId: 'com.example.dalel.RunnerTests',
  );
}
