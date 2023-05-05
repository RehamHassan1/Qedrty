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
    apiKey: 'AIzaSyAP5MIEGjkpaUVKQ1uBnfZKew_cxBmuOkQ',
    appId: '1:840702052282:web:c0ea772e37e4bd6df23f83',
    messagingSenderId: '840702052282',
    projectId: 'aswan-a22c9',
    authDomain: 'aswan-a22c9.firebaseapp.com',
    storageBucket: 'aswan-a22c9.appspot.com',
    measurementId: 'G-DLM880847P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXtVNIz7yCUlW5bkxoF2Uy5lucuxbd_1c',
    appId: '1:840702052282:android:3a65dd63aa791870f23f83',
    messagingSenderId: '840702052282',
    projectId: 'aswan-a22c9',
    storageBucket: 'aswan-a22c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApjrY4ciLqPtDGyUpZzrEwxGr8On0NJ6U',
    appId: '1:840702052282:ios:a38f56f6862ed21cf23f83',
    messagingSenderId: '840702052282',
    projectId: 'aswan-a22c9',
    storageBucket: 'aswan-a22c9.appspot.com',
    iosClientId: '840702052282-euc54r283vki891pg64570gu93br3pcn.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApp2drety',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApjrY4ciLqPtDGyUpZzrEwxGr8On0NJ6U',
    appId: '1:840702052282:ios:a38f56f6862ed21cf23f83',
    messagingSenderId: '840702052282',
    projectId: 'aswan-a22c9',
    storageBucket: 'aswan-a22c9.appspot.com',
    iosClientId: '840702052282-euc54r283vki891pg64570gu93br3pcn.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApp2drety',
  );
}
