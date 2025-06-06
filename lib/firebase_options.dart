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
    apiKey: 'AIzaSyDF7BWa8LZA3tvgRESMeL8hC38Q2JHQkgA',
    appId: '1:37273243560:web:3161b7703b14995d01179d',
    messagingSenderId: '37273243560',
    projectId: 'chats-1d0e3',
    authDomain: 'chats-1d0e3.firebaseapp.com',
    storageBucket: 'chats-1d0e3.firebasestorage.app',
    measurementId: 'G-1LG4DFPQ47',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyColEKq73T3AfmklfVKBOH0ER1pSE6S4y8',
    appId: '1:37273243560:android:d76ec3464b2439a901179d',
    messagingSenderId: '37273243560',
    projectId: 'chats-1d0e3',
    storageBucket: 'chats-1d0e3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAa_su8oTP61yYYUVSiF8tROPrep6kyNKU',
    appId: '1:37273243560:ios:e32af45c8fc7465201179d',
    messagingSenderId: '37273243560',
    projectId: 'chats-1d0e3',
    storageBucket: 'chats-1d0e3.firebasestorage.app',
    iosBundleId: 'com.example.chats',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAa_su8oTP61yYYUVSiF8tROPrep6kyNKU',
    appId: '1:37273243560:ios:e32af45c8fc7465201179d',
    messagingSenderId: '37273243560',
    projectId: 'chats-1d0e3',
    storageBucket: 'chats-1d0e3.firebasestorage.app',
    iosBundleId: 'com.example.chats',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDF7BWa8LZA3tvgRESMeL8hC38Q2JHQkgA',
    appId: '1:37273243560:web:c85f97d69b49b04a01179d',
    messagingSenderId: '37273243560',
    projectId: 'chats-1d0e3',
    authDomain: 'chats-1d0e3.firebaseapp.com',
    storageBucket: 'chats-1d0e3.firebasestorage.app',
    measurementId: 'G-X75XXC1106',
  );
}
