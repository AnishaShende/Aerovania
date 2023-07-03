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
    apiKey: 'AIzaSyDMsfctZ8uKv5OUPA3bMXTlXvILeYkJCBY',
    appId: '1:807752046700:web:61bd7bd2fdaa880cc66049',
    messagingSenderId: '807752046700',
    projectId: 'aerovania-app',
    authDomain: 'aerovania-app.firebaseapp.com',
    storageBucket: 'aerovania-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCb3221eb_rpyiM4TjjEh0k1jtctXmVkHc',
    appId: '1:807752046700:android:c65768754343d871c66049',
    messagingSenderId: '807752046700',
    projectId: 'aerovania-app',
    storageBucket: 'aerovania-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBe5xcURPbKbAun4FKH6uxnl_5ZQ0nMuA',
    appId: '1:807752046700:ios:38a0d86e3508572ac66049',
    messagingSenderId: '807752046700',
    projectId: 'aerovania-app',
    storageBucket: 'aerovania-app.appspot.com',
    iosClientId: '807752046700-4lntjtvqjmgcjhc95ebnmnevgrik7uce.apps.googleusercontent.com',
    iosBundleId: 'com.example.aerovaniaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBe5xcURPbKbAun4FKH6uxnl_5ZQ0nMuA',
    appId: '1:807752046700:ios:7018a87fd915ea7bc66049',
    messagingSenderId: '807752046700',
    projectId: 'aerovania-app',
    storageBucket: 'aerovania-app.appspot.com',
    iosClientId: '807752046700-sak1hiihncmul3nos139op82ingev8f5.apps.googleusercontent.com',
    iosBundleId: 'com.example.aerovaniaApp.RunnerTests',
  );
}