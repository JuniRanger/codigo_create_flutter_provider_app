import 'package:firebase_core/firebase_core.dart';

class FirebaseOptionsForApp {
  FirebaseOptionsForApp._();

  static FirebaseOptions get dev => const FirebaseOptions(
        apiKey: 'AIzaSyA_mDikkCUSSDXiwFKly7GlC25LJEJHsFA',
        appId: '1:747799024060:android:12a44c09b32bf75c3d5bb9',
        messagingSenderId: '747799024060',
        projectId: 'note-app-dev',
        authDomain: 'note-app-dev.firebaseapp.com',
        storageBucket: 'note-app-dev.appspot.com',
      );

  static FirebaseOptions get prod => const FirebaseOptions(
        apiKey: 'AIzaSyB9uzuxTzPD9HeR_h_I7yFoiQ8Nmo7Hirs',
        appId: '1:514413640785:android:2a7848a3d2174f40098c70',
        messagingSenderId: '514413640785',
        projectId: 'note-app-prod-aa3d9',
        authDomain: 'note-app-prod-aa3d9.firebaseapp.com',
        storageBucket: 'note-app-prod-aa3d9.appspot.com',
      );
}
