// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: 'your_api_key',
        appId: 'your_app_id',
        messagingSenderId: 'your_messaging_sender_id',
        projectId: 'your_project_id',
        authDomain: 'your_auth_domain',
        databaseURL: 'your_database_url',
        storageBucket: 'your_storage_bucket',
      );
    }
    // Add your Android and iOS configurations here.
    throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
  }
}
