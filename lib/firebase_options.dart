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
    apiKey: 'AIzaSyCWiKlRD_N5oKsKZgNxxi9S11O6g-A9jc4',
    appId: '1:646682152308:web:55b3da72570de9749ef021',
    messagingSenderId: '646682152308',
    projectId: 'authflutter-3407c',
    authDomain: 'authflutter-3407c.firebaseapp.com',
    storageBucket: 'authflutter-3407c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXKw-7OJiUUylSpxwu4a7X-YI9zEUEU78',
    appId: '1:646682152308:android:63eb6638009dd0309ef021',
    messagingSenderId: '646682152308',
    projectId: 'authflutter-3407c',
    storageBucket: 'authflutter-3407c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHd1PjWjQmrVEMQuYGFo9IDRNAUWgDTmE',
    appId: '1:646682152308:ios:6a023a4123e8e0779ef021',
    messagingSenderId: '646682152308',
    projectId: 'authflutter-3407c',
    storageBucket: 'authflutter-3407c.appspot.com',
    iosClientId: '646682152308-bqi42obnjm62ru8pk9q48k93aa78t1qe.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHd1PjWjQmrVEMQuYGFo9IDRNAUWgDTmE',
    appId: '1:646682152308:ios:6a023a4123e8e0779ef021',
    messagingSenderId: '646682152308',
    projectId: 'authflutter-3407c',
    storageBucket: 'authflutter-3407c.appspot.com',
    iosClientId: '646682152308-bqi42obnjm62ru8pk9q48k93aa78t1qe.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAplication',
  );
}